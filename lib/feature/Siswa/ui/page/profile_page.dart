import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/image_helper.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:internship_app/core/utils/token_manager.dart';
import 'package:internship_app/feature/Auth/bloc/auth_bloc.dart';
import 'package:internship_app/feature/Auth/ui/screen/Intro_screen.dart';
import 'package:internship_app/feature/Root/ui/root_page.dart';
import 'package:internship_app/feature/Siswa/bloc/siswa_bloc.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<void> _uploadPhoto(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    final file = File(pickedFile.path);

    try {
      final dio = Dio();
      final formData = FormData.fromMap({
        'foto': await MultipartFile.fromFile(file.path,
            filename: basename(file.path)),
      });

      final tokenManager = TokenManager(await SharedPreferences.getInstance());
      final token = await tokenManager.getToken();
      log(token.toString());
      const baseUrl = AppConstants.baseUrl;
      final response = await dio.post(
        '$baseUrl/update/foto-profil',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        showSuccessToast(context, "Nah ngunu kan CAKEP !");

        context.read<SiswaBloc>().add(SiswaCheck());
      } else {
        showInfoToast(context, "Gagal upload foto");
      }
    } catch (e) {
      log(e.toString());
      showInfoToast(context, "Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SiswaBloc, SiswaState>(
          builder: (context, state) {
            if (state is SiswaSuccess) {
              final siswa = state;
              const storageUrl = AppConstants.baseStorage;
              return Column(
                children: [
                  // Header Profile
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF0B1E3C),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => _uploadPhoto(context),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              UniversalNetworkImage(
                                url: '$storageUrl/${siswa.user.user.picture}',
                                width: 80,
                                height: 70,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),
                        Text(siswa.user.user.name,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const SizedBox(height: 4),
                        Text(siswa.user.user.email,
                            style: const TextStyle(color: Colors.white70)),
                        if (siswa.user.user.picture == null) ...[
                          const SizedBox(height: 10),
                          const BlinkText(
                            text: 'NDANG UPDATE FOTO GAWE RAIMU !',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.calendar_today,
                                color: Colors.white70, size: 16),
                            Text(
                              "Mulai: ${DateFormat('dd MMM yyyy').format(DateTime.parse(siswa.user.mulaiMagang))}",
                              style: const TextStyle(color: Colors.white70),
                            ),
                            const Padding(padding: EdgeInsets.all(12)),
                            const Icon(Icons.calendar_today_outlined,
                                color: Colors.white70, size: 16),
                            Text(
                              "Selesai: ${DateFormat('dd MMM yyyy').format(DateTime.parse(siswa.user.selesaiMagang))}",
                              style: const TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.timelapse,
                                color: Colors.orangeAccent, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              "Sisa waktu : ${DateTime.parse(siswa.user.selesaiMagang).difference(DateTime.now()).inDays} hari",
                              style: const TextStyle(
                                  color: Colors.orangeAccent, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Points section
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 16),
                          child: Column(
                            children: [
                              const Text("Your Points",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              const Text("+20 since last week",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                              const SizedBox(height: 16),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: CircularProgressIndicator(
                                      value: siswa.user.id / 100,
                                      backgroundColor: Colors.grey[200],
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.orange),
                                      strokeWidth: 8,
                                    ),
                                  ),
                                  Text("${siswa.user.id}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IndicatorLabel(
                                      color: Colors.amber, label: "Workspace"),
                                  IndicatorLabel(
                                      color: Colors.black87, label: "Task"),
                                  IndicatorLabel(
                                      color: Colors.grey, label: "Informasi"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Menu bawah
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        const SizedBox(height: 16),
                        MenuTile(
                          icon: Icons.home,
                          title: "Beranda",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const RootPage()),
                            );
                          },
                        ),
                        MenuTile(
                          icon: Icons.person,
                          title: "Update Profil",
                          onTap: () {
                            // TODO: Navigate to Update Profil
                          },
                        ),
                        MenuTile(
                          icon: Icons.history,
                          title: "Riwayat Absensi",
                          onTap: () {
                            // TODO: Navigate to Riwayat Absensi
                          },
                        ),
                        MenuTile(
                          icon: Icons.logout,
                          title: "Keluar",
                          onTap: () {
                            context.read<AuthBloc>().add(LoggedOut());
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const IntroScreen()),
                            );
                            showInfoToast(context, 'Berhasil Logout');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is SiswaLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('Gagal memuat data profil.'));
            }
          },
        ),
      ),
    );
  }
}

class IndicatorLabel extends StatelessWidget {
  final Color color;
  final String label;

  const IndicatorLabel({required this.color, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: color),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class BlinkText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const BlinkText({required this.text, this.style, super.key});

  @override
  State<BlinkText> createState() => _BlinkTextState();
}

class _BlinkTextState extends State<BlinkText> {
  double _opacity = 1.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      setState(() {
        _opacity = _opacity == 1.0 ? 0.0 : 1.0;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 300),
      child: Text(widget.text, style: widget.style),
    );
  }
}
