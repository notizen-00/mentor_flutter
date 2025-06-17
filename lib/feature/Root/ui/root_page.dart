// feature/Root/page/root_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/core/utils/image_helper.dart';
import 'package:internship_app/feature/Absensi/bloc/absensi_bloc.dart';
import 'package:internship_app/feature/Absensi/ui/widget/jam_keluar.dart';
import 'package:internship_app/feature/Absensi/ui/widget/jam_masuk.dart';
import 'package:internship_app/feature/Absensi/ui/widget/map_widget.dart';
import 'package:internship_app/feature/Dashboard/ui/page/dashboard_page.dart';
import 'package:internship_app/feature/Informasi/ui/page/informasi_page.dart';
import 'package:internship_app/feature/Informasi/ui/widget/informasi_card.dart';
import 'package:internship_app/feature/Logbook/ui/page/logbook_page.dart';
import 'package:internship_app/feature/Logbook/ui/screen/logbook_create.dart';
import 'package:internship_app/feature/Logbook/ui/widget/logbook_info.dart';
import 'package:internship_app/feature/Siswa/bloc/siswa_bloc.dart';
import 'package:internship_app/feature/Siswa/ui/page/profile_page.dart';
import 'package:internship_app/feature/Siswa/ui/page/siswa_page.dart';
import 'package:internship_app/feature/Task/ui/page/task_page.dart';
import 'package:internship_app/feature/Task/ui/widget/task_info.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _profile(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
    // showInfoToast(context, 'Berhasil Logout');
  }

  final List<Widget> _pages = [
    const DashboardPage(),
    const InformasiPage(),
    const LogbookPage(),
    const TaskPage(),
  ];

  final List<String> _pageTitles = [
    "Dashboard",
    "Informasi",
    "Karyawan",
    "Task"
  ];

  final List<IconData> _pageIcons = [
    Icons.dashboard,
    Icons.info,
    Icons.bookmarks_sharp,
    Icons.task_rounded
  ];

  final List<IconData> _pageSelectedIcons = [
    Icons.dashboard_outlined,
    Icons.info_outline,
    Icons.bookmarks_outlined,
    Icons.task_outlined
  ];

  @override
  Widget build(BuildContext context) {
    context.read<SiswaBloc>().add(SiswaCheck());
    final Color selectedColor =
        Theme.of(context).bottomNavigationBarTheme.selectedItemColor ??
            Theme.of(context).colorScheme.primary;
    final Color unselectedColor =
        Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ??
            Colors.grey;
    context.read<AbsensiBloc>().add(CheckAbsensi('masuk'));
    context.read<AbsensiBloc>().add(CheckAbsensi('keluar'));
    return Scaffold(
      appBar: AppBar(
        elevation: 19,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(46.0),
            bottomRight: Radius.circular(46.0),
          ),
        ),
        backgroundColor: AppColors.primary,
        title: Text(
          _pageTitles[_currentIndex],
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            tooltip: 'Profile',
            onPressed: () => _profile(context),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                BlocBuilder<SiswaBloc, SiswaState>(
                  builder: (context, state) {
                    if (state is SiswaSuccess) {
                      const storageUrl = AppConstants.baseStorage;
                      final siswa = state;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40.0, top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UniversalNetworkImage(
                              url: '$storageUrl/${siswa.user.picture}',
                              width: 80,
                              height: 70,
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  siswa.user.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '${siswa.user.email}}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else if (state is SiswaLoading) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 40.0, top: 10.0),
                        child: AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(seconds: 1),
                          child: Text(
                            'Ganbatte :)',
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 40.0, top: 10.0),
                        child: Text(
                          'Nama tidak tersedia',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      );
                    }
                  },
                ),
                Positioned(
                    bottom: -40,
                    left: 0,
                    right: 0,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        final inAnimation = Tween<Offset>(
                          begin: const Offset(0.0, 0.6), // dari bawah naik
                          end: Offset.zero,
                        ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeIn,
                        ));

                        final fadeAnimation = CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOutSine,
                        );

                        return SlideTransition(
                          position: inAnimation,
                          child: FadeTransition(
                            opacity: fadeAnimation,
                            child: child,
                          ),
                        );
                      },
                      child: _buildAnimatedContent(),
                    ))
              ],
            ),
          ),
        ),
      ),
      body: BlocListener<SiswaBloc, SiswaState>(
        listener: (context, state) {
          if (state is SiswaSuccess) {
          } else if (state is SiswaError) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SiswaPage()),
            );
          }
        },
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      endDrawer: const LogbookFormDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Scaffold.of(context).openEndDrawer(); // Buka drawer dari kanan
          },
          tooltip: 'Task',
          child: const Icon(Icons.add_task_outlined, color: AppColors.white),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavIcon(
                  index: 0,
                  icon: _pageIcons[0],
                  selectedIcon: _pageSelectedIcons[0],
                  selectedColor: selectedColor,
                  unselectedColor: unselectedColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0), // Geser ke kiri
                  child: _buildNavIcon(
                    index: 2,
                    icon: _pageIcons[2],
                    selectedIcon: _pageSelectedIcons[2],
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                ),
                const SizedBox(width: 0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0), // Geser ke kiri
                  child: _buildNavIcon(
                    index: 3,
                    icon: _pageIcons[3],
                    selectedIcon: _pageSelectedIcons[3],
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                ), // Slot untuk FAB
                Padding(
                  padding: const EdgeInsets.only(left: 0), // Geser ke kanan
                  child: _buildNavIcon(
                    index: 1,
                    icon: _pageIcons[1],
                    selectedIcon: _pageSelectedIcons[1],
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildAnimatedContent() {
    switch (_currentIndex) {
      case 0:
        return const Row(
          key: ValueKey('home'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [InformasiInfoCard()],
        );
      case 1:
        return const Row(
          key: ValueKey('informasi'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [InformasiInfoCard()],
        );

      case 2:
        return const Padding(
          padding: EdgeInsets.only(top: 20),
          key: ValueKey('logbook'),
          child: Center(
            child: LogbookInfoCard(),
          ),
        );
      case 3:
        return const Padding(
          padding: EdgeInsets.only(top: 20),
          key: ValueKey('task'),
          child: Center(
            child: TaskInfoCard(),
          ),
        );

      default:
        return const SizedBox.shrink(
          key: ValueKey('empty'),
        );
    }
  }

  Widget _buildNavIcon({
    required int index,
    required IconData icon,
    required IconData selectedIcon,
    required Color selectedColor,
    required Color unselectedColor,
  }) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Icon(
          isSelected ? selectedIcon : icon,
          color: isSelected ? selectedColor : unselectedColor,
        ),
      ),
    );
  }
}

class ProxyNetworkImage extends StatelessWidget {
  final String? url;
  final double width;
  final double height;

  const ProxyNetworkImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final fallbackUrl = 'https://avatar.iran.liara.run/public/';
    final imageUrl = (url != null && url!.isNotEmpty) ? url! : fallbackUrl;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            color: Colors.grey[300],
            child: const Icon(Icons.image_not_supported, color: Colors.grey),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(strokeWidth: 2),
          );
        },
      ),
    );
  }
}
