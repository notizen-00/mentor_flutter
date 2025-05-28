import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:internship_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:internship_app/core/utils/absensi_manager.dart';
import 'package:internship_app/core/utils/logbook_manager.dart';
import 'package:internship_app/core/utils/siswa_manager.dart';
import 'package:internship_app/core/utils/token_manager.dart';
import 'package:internship_app/feature/Absensi/bloc/absensi_bloc.dart';
import 'package:internship_app/feature/Absensi/data/repository/absensi_repository.dart';
import 'package:internship_app/feature/Informasi/bloc/informasi_bloc.dart';
import 'package:internship_app/feature/Informasi/data/repository/informasi_repository.dart';
import 'package:internship_app/feature/Logbook/bloc/logbook_bloc.dart';
import 'package:internship_app/feature/Logbook/data/repository/logbook_repository.dart';
import 'package:internship_app/feature/Siswa/bloc/siswa_bloc.dart';
import 'package:internship_app/feature/Siswa/data/repository/siswa_repository.dart';
import 'package:internship_app/feature/Task/bloc/task_bloc.dart';
import 'package:internship_app/feature/Task/data/repository/task_repository.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internship_app/feature/Auth/data/repository/auth_repository.dart';
import 'package:internship_app/feature/Auth/bloc/auth_bloc.dart';

final sl = GetIt.instance;

final FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> requestNotificationPermission() async {
  // Untuk Android 13+ atau iOS
  final status = await Permission.notification.request();

  if (status.isGranted) {
    log('Izin notifikasi diberikan');
  } else {
    log('Izin notifikasi DITOLAK');
  }
}

Future<void> showTestNotification(String title, String body) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    channelDescription: 'Deskripsi channel',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidDetails,
  );

  await notificationsPlugin.show(
    0, // ID
    title,
    body,
    notificationDetails,
  );
}

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Inisialisasi notifikasi
  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidInit);
  await notificationsPlugin.initialize(initSettings);

  // Register Manager
  sl.registerLazySingleton(() => TokenManager(sl()));
  sl.registerLazySingleton(() => LogbookManager(sl()));
  sl.registerLazySingleton(() => SiswaManager(sl()));
  sl.registerLazySingleton(() => AbsensiManager(sl()));

  // Register Repository
  sl.registerLazySingleton(() => AuthRepository(sl()));
  sl.registerLazySingleton(() => SiswaRepository(sl(), sl()));
  sl.registerLazySingleton(() => LogbookRepository(sl(), sl()));
  sl.registerLazySingleton(() => InformasiRepository(sl()));
  sl.registerLazySingleton(() => TaskRepository(sl()));
  sl.registerLazySingleton(() => AbsensiRepository(sl(), sl()));

  // Cubit
  sl.registerLazySingleton(() => AppUserCubit(sl()));

  // Bloc
  sl.registerFactory(() => SiswaBloc(
        siswaRepository: sl(),
        siswaManager: sl(),
      ));
  sl.registerFactory(() => AbsensiBloc(
        absensiRepository: sl(),
        absensiManager: sl(),
      ));
  sl.registerFactory(() => LogbookBloc(
        logbookRepository: sl(),
      ));
  sl.registerFactory(() => InformasiBloc(
        informasiRepository: sl(),
      ));
  sl.registerFactory(() => TaskBloc(
        taskRepository: sl(),
      ));
  sl.registerFactory(() => AuthBloc(
        authRepository: sl(),
        siswaManager: sl(),
        appUserCubit: sl(),
        tokenManager: sl(),
      ));
}
