import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:internship_app/core/services/service_locator.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/core/websockets/connect.dart';
import 'package:internship_app/feature/Absensi/bloc/absensi_bloc.dart';
import 'package:internship_app/feature/Auth/bloc/auth_bloc.dart';
import 'package:internship_app/feature/Auth/ui/screen/Intro_screen.dart';
import 'package:internship_app/feature/Informasi/bloc/informasi_bloc.dart';
import 'package:internship_app/feature/Logbook/bloc/logbook_bloc.dart';
import 'package:internship_app/feature/Root/ui/root_page.dart';
import 'package:internship_app/feature/Siswa/bloc/siswa_bloc.dart';
import 'package:internship_app/feature/Task/bloc/task_bloc.dart';
import 'package:internship_app/feature/Tool/bloc/tool_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  await requestNotificationPermission();
  connectToPusher();
  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

// App utama
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppUserCubit>(
            create: (_) => sl<AppUserCubit>(),
          ),
          BlocProvider<AuthBloc>(
            create: (_) => sl<AuthBloc>(),
          ),
          BlocProvider<SiswaBloc>(
            create: (_) => sl<SiswaBloc>(),
          ),
          BlocProvider<AbsensiBloc>(
            create: (_) => sl<AbsensiBloc>(),
          ),
          BlocProvider<LogbookBloc>(
            create: (_) => sl<LogbookBloc>(),
          ),
          BlocProvider<TaskBloc>(
            create: (_) => sl<TaskBloc>(),
          ),
          BlocProvider<InformasiBloc>(
            create: (_) => sl<InformasiBloc>(),
          ),
          BlocProvider<ToolBloc>(
            create: (_) => sl<ToolBloc>(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mentor App',
          theme: ThemeData(
            textTheme: const TextTheme(
              displayLarge: TextStyle(fontSize: 24), // default: 57
              displayMedium: TextStyle(fontSize: 15),
              displaySmall: TextStyle(fontSize: 12),
              headlineLarge: TextStyle(fontSize: 12),
              headlineMedium: TextStyle(fontSize: 11),
              headlineSmall: TextStyle(fontSize: 10),
              titleLarge: TextStyle(fontSize: 13),
              titleMedium: TextStyle(fontSize: 12),
              titleSmall: TextStyle(fontSize: 12),
              bodyLarge: TextStyle(fontSize: 11),
              bodyMedium: TextStyle(fontSize: 10),
              bodySmall: TextStyle(fontSize: 8),
              labelLarge: TextStyle(fontSize: 12),
              labelMedium: TextStyle(fontSize: 11),
              labelSmall: TextStyle(fontSize: 10),
            ),
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              surface: Colors.white,
            ),
            useMaterial3: true,
          ),
          home: const StartupPage(),
        ),
      ),
    );
  }
}

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppUserCubit>().updateUser();
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        if (state is AppUserLoggedIn) {
          return const RootPage();
        } else if (state is AppUserInitial) {
          return const IntroScreen();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
