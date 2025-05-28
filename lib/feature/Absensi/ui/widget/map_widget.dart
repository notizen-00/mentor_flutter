import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/feature/Absensi/bloc/absensi_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internship_app/core/utils/toast_utils.dart'; // Pastikan import ini ada dan benar path-nya

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController _mapController = MapController();
  LatLng? _userLocation;
  bool _isLoadingLocation = true;

  // Definisikan koordinat dan radius kantor
  final LatLng _officeLocation = const LatLng(-8.164095, 113.717209);
  final double _officeRadiusMeters = 40.0;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showErrorToast("Layanan lokasi tidak aktif.");
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showErrorToast("Izin lokasi ditolak.");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _showErrorToast(
            "Izin lokasi ditolak permanen. Aktifkan dari pengaturan.");
        return;
      }

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final currentLatLng = LatLng(position.latitude, position.longitude);

      log('User Location: $currentLatLng');
      if (!mounted) return;
      setState(() {
        _userLocation = currentLatLng;
        _isLoadingLocation = false;
      });

      // Setelah build selesai, pindah ke posisi pengguna jika map sudah siap
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_userLocation != null) {
          _mapController.move(_userLocation!, 17.0);
        }
      });
    } catch (e) {
      log("Error getting location: $e");
      _showErrorToast("Gagal mendapatkan lokasi: $e");
    }
  }

  void _showErrorToast(String message) {
    if (!mounted) return;
    if (mounted) {
      showErrorToast(context, message);
    }

    setState(() {
      _isLoadingLocation = false;
    });
  }

  void _showAbsenTypeDrawer(BuildContext context) {
    if (_userLocation == null) {
      showErrorToast(context, 'Lokasi Anda belum ditemukan. Coba lagi.');
      _getCurrentLocation();
      return;
    }

    final double distanceInMeters = const Distance().as(
      LengthUnit.Meter,
      _officeLocation,
      _userLocation!,
    );

    if (distanceInMeters > _officeRadiusMeters) {
      showErrorToast(context,
          'Anda berada di luar jangkauan area kantor (${distanceInMeters.toStringAsFixed(2)} meter). Absen hanya bisa dilakukan dalam radius $_officeRadiusMeters meter.');
      return;
    }

    // Jika dalam radius, tampilkan bottom sheet absen
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Pilih Jenis Absen",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.login),
                      label: const Text("Masuk"),
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<AbsensiBloc>().add(DoAbsen('masuk'));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.logout),
                      label: const Text("Keluar"),
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<AbsensiBloc>().add(DoAbsen('keluar'));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: _userLocation ?? _officeLocation,
            zoom: 18.0,
            minZoom: 10.0,
            maxZoom: 19.0,
            onMapReady: () {
              if (_userLocation != null) {
                _mapController.move(_userLocation!, 18.0);
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName:
                  'com.example.app', // Ganti dengan package name aplikasi Anda
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                  point: _officeLocation,
                  radius: _officeRadiusMeters,
                  color: Colors.greenAccent.withOpacity(0.3),
                  borderColor: Colors.green,
                  borderStrokeWidth: 2,
                  useRadiusInMeter: true,
                ),
              ],
            ),
            if (_userLocation != null)
              MarkerLayer(
                markers: [
                  Marker(
                    point: _userLocation!,
                    width: 80,
                    height: 80,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text("Anda",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                        Icon(
                          Icons.person_pin_circle,
                          color: Theme.of(context).colorScheme.primary,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
        if (_isLoadingLocation)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text("Mencari lokasi Anda...",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        Positioned(
          bottom: MediaQuery.of(context).padding.top + 20,
          right: 10,
          child: FloatingActionButton.small(
            heroTag: 'refreshLocationFab',
            onPressed: _isLoadingLocation ? null : _getCurrentLocation,
            backgroundColor: Theme.of(context).colorScheme.surface,
            tooltip: 'Segarkan Lokasi',
            child: _isLoadingLocation
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                : Icon(Icons.my_location,
                    color: Theme.of(context).colorScheme.primary),
          ),
        ),
        Positioned(
          top: 40,
          right: 0,
          left: 0,
          child: Center(
            child: Card(
              color: Colors.white.withOpacity(0.4),
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width * 2,
                constraints: const BoxConstraints(maxWidth: 300),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Presensi Kehadiran',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      _userLocation == null
                          ? 'Lokasi Anda belum terdeteksi. Pastikan GPS aktif dan izin lokasi diberikan.'
                          : 'Informasi lokasi ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 13),
                    ),
                    if (_userLocation != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Lat: ${_userLocation!.latitude.toStringAsFixed(5)}, Lng: ${_userLocation!.longitude.toStringAsFixed(5)}',
                          style:
                              const TextStyle(fontSize: 11, color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.fingerprint,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Tap untuk presensi',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: _isLoadingLocation || _userLocation == null
                          ? null
                          : () => _showAbsenTypeDrawer(context),
                      style: ElevatedButton.styleFrom(
                        overlayColor: AppColors.accent,
                        backgroundColor: Colors.blueAccent.withOpacity(0.3),
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(22, 23)),
                        ),
                        minimumSize: const Size(double.infinity, 48),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
