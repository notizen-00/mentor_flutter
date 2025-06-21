import 'package:flutter/material.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart';

class TaskProgressList extends StatelessWidget {
  final List<TaskSchema> schemas;

  const TaskProgressList({super.key, required this.schemas});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: schemas
          .map((schema) => _ProgressItem(
              text: schema.namaSchema,
              isDone: schema.status == 1 // misal 1 = done
              ))
          .toList(),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String text;
  final bool isDone;

  const _ProgressItem({required this.text, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        isDone ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isDone ? Colors.green : Colors.grey,
      ),
      title: Text(text),
    );
  }
}
