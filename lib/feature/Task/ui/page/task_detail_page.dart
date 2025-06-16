import 'package:flutter/material.dart';
import 'package:internship_app/core/theme/app_colors.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Task Detail Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(),
    );
  }
}
