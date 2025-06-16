import 'dart:developer';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:internship_app/feature/Logbook/bloc/logbook_bloc.dart';
import 'package:internship_app/feature/Logbook/data/model/logbook_model.dart';
import 'package:internship_app/feature/Task/bloc/task_bloc.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart';

class Mentor {
  final int id;
  final String name;

  Mentor({required this.id, required this.name});

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(
      id: json['id'],
      name: json['name'],
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

  File? _imageFile;

  int? _selectedMentorId;
  List<Location> _mentors = [];
  bool _isLoadingMentor = true;

  Future<void> fetchMentors() async {
    try {
      const baseUrl = AppConstants.baseUrl;
      final response =
          await http.get(Uri.parse('$baseUrl/get_location')); // Ganti URL
      log(response.body);
      if (!mounted) return;
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        log('data $data');
        setState(() {
          _mentors = data.map((e) => Location.fromJson(e)).toList();
          _isLoadingMentor = false;
        });
      } else {
        showErrorToast(context, 'Gagal memuat data lokasi');
        setState(() => _isLoadingMentor = false);
      }
    } catch (e) {
      showErrorToast(context, 'Error memuat mentor: $e');
      setState(() => _isLoadingMentor = false);
    }
  }

  void _submitForm() {
    final namaTask = _namaTaskController.text.trim();
    final keterangan = _keteranganController.text.trim();

    if (namaTask.isEmpty || keterangan.isEmpty || _selectedMentorId == null) {
      showErrorToast(context, 'Harap isi semua form!');
      return;
    }

    context.read<TaskBloc>().add(CreateTask(
        locationId: _selectedMentorId!,
        namaTask: namaTask,
        keterangan: keterangan));

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task berhasil di broadcast ke Siswa Magang'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchMentors();
  }

  @override
  void dispose() {
    _namaTaskController.dispose();
    _keteranganController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
                        onChanged: (value) {
                          setState(() {
                            _selectedMentorId = value;
                          });
                        },
                      ),
                const SizedBox(height: 12),
                TextField(
                  controller: _namaTaskController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Task',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _keteranganController,
                  decoration: const InputDecoration(
                    labelText: 'Keterangan',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                const SizedBox(height: 20),
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
}
