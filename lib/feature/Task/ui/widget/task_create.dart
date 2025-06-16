import 'dart:developer';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
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

class TaskFormDrawer extends StatefulWidget {
  const TaskFormDrawer({super.key});

  @override
  State<TaskFormDrawer> createState() => _TaskFormDrawerState();
}

class _TaskFormDrawerState extends State<TaskFormDrawer> {
  final TextEditingController _kegiatanController = TextEditingController();
  final TextEditingController _permasalahanController = TextEditingController();
  final TextEditingController _solusiController = TextEditingController();

  File? _imageFile;
  bool _isPicking = false;

  int? _selectedMentorId;
  List<Mentor> _mentors = [];
  bool _isLoadingMentor = true;

  Future<void> fetchMentors() async {
    try {
      const baseUrl = AppConstants.baseUrl;
      final response =
          await http.get(Uri.parse('$baseUrl/mentor')); // Ganti URL
      log(response.body);
      if (!mounted) return;
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        log('data $data');
        setState(() {
          _mentors = data.map((e) => Mentor.fromJson(e)).toList();
          _isLoadingMentor = false;
        });
      } else {
        showErrorToast(context, 'Gagal memuat data mentor');
        setState(() => _isLoadingMentor = false);
      }
    } catch (e) {
      showErrorToast(context, 'Error memuat mentor: $e');
      setState(() => _isLoadingMentor = false);
    }
  }

  Future<void> _pickImage() async {
    if (_isPicking) return;
    setState(() => _isPicking = true);

    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) {
        setState(() {
          _imageFile = File(picked.path);
        });
      }
    } catch (e) {
      if (!mounted) return;
      showErrorToast(context, 'Gagal memilih gambar: $e');
    } finally {
      setState(() => _isPicking = false);
    }
  }

  void _submitForm() {
    final kegiatan = _kegiatanController.text.trim();
    final permasalahan = _permasalahanController.text.trim();
    final solusi = _solusiController.text.trim();

    if (kegiatan.isEmpty ||
        permasalahan.isEmpty ||
        solusi.isEmpty ||
        _selectedMentorId == null) {
      showErrorToast(context, 'Harap isi semua form!');
      return;
    }

    final taskData = TaskData(
      mentorId: _selectedMentorId!,
      permasalahan: permasalahan,
      solusi: solusi,
      namaKegiatan: kegiatan,
      foto: _imageFile,
    );

    context.read<TaskBloc>().add(Createtask(taskData));

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('task berhasil dikirim ke mentor ID: $_selectedMentorId'),
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
    _kegiatanController.dispose();
    _permasalahanController.dispose();
    _solusiController.dispose();
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
                Text('Form tambah task',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                _isLoadingMentor
                    ? const Center(child: CircularProgressIndicator())
                    : DropdownButtonFormField<int>(
                        value: _selectedMentorId,
                        decoration: const InputDecoration(
                          labelText: 'Pilih Mentor',
                          border: OutlineInputBorder(),
                        ),
                        items: _mentors.map((mentor) {
                          return DropdownMenuItem<int>(
                            value: mentor.id,
                            child: SizedBox(
                              width: width * 0.6,
                              child: Text(
                                mentor.name,
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
                  controller: _kegiatanController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Kegiatan',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _permasalahanController,
                  decoration: const InputDecoration(
                    labelText: 'Permasalahan',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _solusiController,
                  decoration: const InputDecoration(
                    labelText: 'Solusi',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                if (_imageFile != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _imageFile!,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                TextButton.icon(
                  onPressed: _isPicking ? null : _pickImage,
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Upload Foto'),
                ),
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
