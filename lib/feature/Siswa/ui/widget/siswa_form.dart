import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/feature/Siswa/bloc/siswa_bloc.dart';
import 'package:internship_app/feature/Siswa/data/model/siswa_model.dart';
import 'package:intl/intl.dart';

class SiswaForm extends StatefulWidget {
  const SiswaForm({super.key});

  @override
  State<SiswaForm> createState() => _SiswaFormState();
}

class _SiswaFormState extends State<SiswaForm> {
  final _formKey = GlobalKey<FormState>();
  final _nisnController = TextEditingController();
  final _asalSekolahController = TextEditingController();
  final _jurusanController = TextEditingController();
  final _alamatController = TextEditingController();
  final _noHpController = TextEditingController();

  DateTime? _mulaiMagang;
  DateTime? _selesaiMagang;

  @override
  void dispose() {
    _nisnController.dispose();
    _asalSekolahController.dispose();
    _jurusanController.dispose();
    _alamatController.dispose();
    _noHpController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isMulai) async {
    final initialDate = isMulai
        ? (_mulaiMagang ?? DateTime.now())
        : (_selesaiMagang ?? DateTime.now());
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isMulai) {
          _mulaiMagang = picked;
        } else {
          _selesaiMagang = picked;
        }
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_mulaiMagang == null || _selesaiMagang == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Silakan pilih tanggal mulai dan selesai magang')),
        );
        return;
      }

      // Kirim data ke backend atau simpan lokal
      print("NISN: ${_nisnController.text}");
      print("Asal Sekolah: ${_asalSekolahController.text}");
      print("Jurusan: ${_jurusanController.text}");
      print("Alamat: ${_alamatController.text}");
      print("No HP: ${_noHpController.text}");
      print("Mulai Magang: ${DateFormat('yyyy-MM-dd').format(_mulaiMagang!)}");
      print(
          "Selesai Magang: ${DateFormat('yyyy-MM-dd').format(_selesaiMagang!)}");

      final siswa = SiswaDataModel(
        nisn: int.parse(_nisnController.text),
        asalSekolah: _asalSekolahController.text,
        jurusan: _jurusanController.text,
        alamat: _alamatController.text,
        noHp: _noHpController.text,
        mulaiMagang: DateFormat('yyyy-MM-dd').format(_mulaiMagang!),
        selesaiMagang: DateFormat('yyyy-MM-dd').format(_selesaiMagang!),
      );

      context.read<SiswaBloc>().add(CreateSiswa(siswa));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          _buildTextField(_nisnController, 'NISN', TextInputType.number),
          _buildTextField(_asalSekolahController, 'Asal Sekolah'),
          _buildTextField(_jurusanController, 'Jurusan'),
          _buildDatePickerField(
              'Mulai Magang', _mulaiMagang, () => _selectDate(context, true)),
          _buildDatePickerField('Selesai Magang', _selesaiMagang,
              () => _selectDate(context, false)),
          _buildTextField(
            _alamatController,
            'Alamat',
            TextInputType.multiline,
          ),
          _buildTextField(_noHpController, 'No HP', TextInputType.phone),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary.withOpacity(0.5),
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(23))),
                foregroundColor: Colors.white,
                minimumSize: const Size(12, 60)),
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Simpan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      [TextInputType? keyboardType, int maxLines = 1]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Field $label wajib diisi';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDatePickerField(
      String label, DateTime? date, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          child: Text(
            date == null ? 'Pilih tanggal' : DateFormat.yMMMMd().format(date),
            style: TextStyle(
              color: date == null ? Colors.grey[600] : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
