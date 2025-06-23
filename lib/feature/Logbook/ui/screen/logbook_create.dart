import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internship_app/feature/Task/data/model/task_model.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:internship_app/feature/Task/bloc/task_bloc.dart';

class Location {
  final int id;
  final String namaLokasi;

  Location({required this.id, required this.namaLokasi});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      namaLokasi: json['nama_lokasi'],
    );
  }
}

class ToolModel {
  final int id;
  final String namaAlat;
  final int stok;

  ToolModel({required this.id, required this.namaAlat, required this.stok});

  factory ToolModel.fromJson(Map<String, dynamic> json) {
    return ToolModel(
      id: json['id'],
      namaAlat: json['nama_alat'],
      stok: json['qty'],
    );
  }
}

class LogbookFormDrawer extends StatefulWidget {
  const LogbookFormDrawer({super.key});

  @override
  State<LogbookFormDrawer> createState() => _LogbookFormDrawerState();
}

class _LogbookFormDrawerState extends State<LogbookFormDrawer> {
  final TextEditingController _namaTaskController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  final List<TextEditingController> _progressControllers = [];
  final TextEditingController _searchToolController = TextEditingController();
  final Map<int, int> _toolQuantities = {}; // key: tool.id, value: qty

  int? _selectedMentorId;
  List<Location> _mentors = [];
  bool _isLoadingMentor = true;

  List<ToolModel> _tools = [];
  List<ToolModel> _selectedTools = [];
  bool _isLoadingTools = true;

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    fetchMentors();
    fetchTools();
    _progressControllers.add(TextEditingController());
  }

  @override
  void dispose() {
    _namaTaskController.dispose();
    _keteranganController.dispose();
    _searchToolController.dispose();
    _debounce?.cancel();
    for (final controller in _progressControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> fetchMentors() async {
    try {
      final response =
          await http.get(Uri.parse('${AppConstants.baseUrl}/get_location'));
      if (!mounted) return;

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        setState(() {
          _mentors = data.map((e) => Location.fromJson(e)).toList();
          _isLoadingMentor = false;
        });
      } else {
        showErrorToast(context, 'Gagal memuat data lokasi');
        setState(() => _isLoadingMentor = false);
      }
    } catch (e) {
      showErrorToast(context, 'Error memuat lokasi: $e');
      setState(() => _isLoadingMentor = false);
    }
  }

  Future<void> fetchTools({String keyword = ''}) async {
    try {
      setState(() => _isLoadingTools = true);
      final response = await http
          .get(Uri.parse('${AppConstants.baseUrl}/tools?search=$keyword'));
      if (!mounted) return;

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        setState(() {
          _tools = data.map((e) => ToolModel.fromJson(e)).toList();
          _isLoadingTools = false;
        });
      } else {
        showErrorToast(context, 'Gagal memuat data alat');
        setState(() => _isLoadingTools = false);
      }
    } catch (e) {
      showErrorToast(context, 'Error memuat alat: $e');
      setState(() => _isLoadingTools = false);
    }
  }

  void _submitForm() {
    final namaTask = _namaTaskController.text.trim();
    final keterangan = _keteranganController.text.trim();
    final progressList = _progressControllers
        .map((c) => c.text.trim())
        .where((text) => text.isNotEmpty)
        .toList();

    if (namaTask.isEmpty || keterangan.isEmpty || _selectedMentorId == null) {
      showErrorToast(context, 'Harap isi semua form !');
      return;
    }

    if (progressList.isEmpty) {
      showErrorToast(context, 'Tambahkan minimal satu progress!');
      return;
    }

    final selectedToolIds = _selectedTools.isNotEmpty
        ? _selectedTools.map((e) => e.id).toList()
        : null;

    final toolQuantities = _selectedTools.isNotEmpty
        ? _selectedTools.map((e) => _toolQuantities[e.id] ?? 1).toList()
        : null;

    final taskData = TaskCreateData(
      locationId: _selectedMentorId!,
      namaTask: namaTask,
      keterangan: keterangan,
      toolIds: selectedToolIds,
      toolQuantities: toolQuantities,
      progressList: progressList,
    );

    context.read<TaskBloc>().add(CreateTask(task: taskData));

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Task berhasil di broadcast ke Siswa Magang')),
    );
  }

  List<Widget> _buildProgressFields() {
    return List.generate(_progressControllers.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _progressControllers[index],
                decoration: InputDecoration(
                  labelText: 'Progress ${index + 1}',
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            if (_progressControllers.length > 1)
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _progressControllers[index].dispose();
                    _progressControllers.removeAt(index);
                  });
                },
              ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Drawer(
      width: width * 0.94,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Buat Task',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                _isLoadingMentor
                    ? const Center(child: CircularProgressIndicator())
                    : DropdownButtonFormField<int>(
                        value: _selectedMentorId,
                        decoration: const InputDecoration(
                          labelText: 'Pilih Lokasi',
                          border: OutlineInputBorder(),
                        ),
                        items: _mentors.map((mentor) {
                          return DropdownMenuItem<int>(
                            value: mentor.id,
                            child: SizedBox(
                              width: width * 0.6,
                              child: Text(
                                mentor.namaLokasi,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) =>
                            setState(() => _selectedMentorId = value),
                      ),

                const SizedBox(height: 12),
                const Text('Alat (Opsional)'),
                // Multi Select Alat
                _isLoadingTools
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MultiSelectDialogField<ToolModel>(
                            dialogHeight: height,
                            dialogWidth: width,
                            items: _tools
                                .map((tool) => MultiSelectItem<ToolModel>(tool,
                                    '${tool.namaAlat} ( stok : ${tool.stok} )'))
                                .toList(),
                            title: const Text("Pilih Alat"),
                            selectedColor: Colors.blue,
                            searchable: true,
                            searchHint: "Cari alat...",
                            buttonText: const Text("Pilih Alat"),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onConfirm: (values) async {
                              setState(() => _selectedTools = values);
                              await _showQtyDialog(values);
                            },
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 6,
                            children: _selectedTools.map((tool) {
                              final qty = _toolQuantities[tool.id] ?? 1;
                              return InputChip(
                                key: ValueKey(tool.id),
                                label: Text('${tool.namaAlat} / $qty item'),
                                onDeleted: () {
                                  setState(() {
                                    _selectedTools.remove(tool);
                                    _toolQuantities.remove(tool.id);
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),

                const SizedBox(height: 12),

                // Nama Task
                TextField(
                  controller: _namaTaskController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Task',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // Keterangan
                TextField(
                  controller: _keteranganController,
                  decoration: const InputDecoration(
                    labelText: 'Keterangan',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),

                // Progress Task
                Text('Progress Task',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                ..._buildProgressFields(),

                // Button tambah progress
                TextButton.icon(
                  onPressed: () => setState(
                      () => _progressControllers.add(TextEditingController())),
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah Progress'),
                ),
                const SizedBox(height: 20),

                // Tombol Kirim
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: _submitForm,
                  child: const Text('Kirim'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showQtyDialog(List<ToolModel> selectedTools) async {
    final Map<int, TextEditingController> qtyControllers = {};

    // Siapkan controller untuk setiap alat, default qty 1
    for (var tool in selectedTools) {
      qtyControllers[tool.id] = TextEditingController(
        text: (_toolQuantities[tool.id] ?? 1).toString(),
      );
    }

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Set Quantity Alat'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: selectedTools.length,
              itemBuilder: (context, index) {
                final tool = selectedTools[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text(tool.namaAlat)),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 80,
                        child: TextField(
                          controller: qtyControllers[tool.id],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Qty',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                bool allValid = true;
                String? errorMessage;

                for (var tool in selectedTools) {
                  final qtyText = qtyControllers[tool.id]?.text ?? '';
                  final qty = int.tryParse(qtyText);

                  if (qty == null || qty <= 0) {
                    allValid = false;
                    errorMessage = 'Isikan Qty dengan angka yang valid!';
                    break;
                  }

                  if (qty > tool.stok) {
                    allValid = false;
                    errorMessage =
                        'Qty untuk "${tool.namaAlat}" tidak boleh melebihi stok (${tool.stok})!';
                    break;
                  }
                }

                if (!allValid) {
                  showErrorToast(context, errorMessage ?? 'Qty tidak valid!');
                  return;
                }

                Navigator.pop(context, true);
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      setState(() {
        for (var tool in selectedTools) {
          final qty = int.tryParse(qtyControllers[tool.id]?.text ?? '1') ?? 1;
          _toolQuantities[tool.id] = qty;
        }
      });
    } else {
      // Jika batal, hapus alat yang tadi dipilih agar user ulangi pilihan
      setState(() {
        _selectedTools.clear();
      });
    }

    // Dispose semua controller
    for (var ctrl in qtyControllers.values) {
      ctrl.dispose();
    }
  }
}
