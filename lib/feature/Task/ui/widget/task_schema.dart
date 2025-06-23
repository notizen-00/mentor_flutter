import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:internship_app/feature/Task/bloc/task_bloc.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart';

class TaskProgressList extends StatelessWidget {
  final List<TaskSchema> schemas;
  final bool isJoined;
  const TaskProgressList(
      {super.key, required this.schemas, required this.isJoined});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: schemas
          .map((schema) => _ProgressItem(
              isJoined: isJoined,
              text: schema.namaSchema,
              taskSchema: schema,
              isDone: schema.status == 1 // misal 1 = done
              ))
          .toList(),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String text;
  final bool isDone;
  final TaskSchema taskSchema;
  final bool isJoined;

  const _ProgressItem(
      {required this.text,
      required this.taskSchema,
      required this.isDone,
      required this.isJoined});

  void _handleConfirm(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Konfirmasi Selesai'),
        content: Text('Tandai "$text" sebagai selesai?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              showInfoToast(
                  context, '${taskSchema.namaSchema} berhasil di selesaikan !');

              context
                  .read<TaskBloc>()
                  .add(CompleteProgress(taskSchemaId: taskSchema.id));
              Navigator.pop(context);
            },
            child: const Text(
              'Selesai',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      hoverColor: Colors.green.shade100,
      splashColor: Colors.green,
      selected: true,
      leading: Icon(
        isDone ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isDone ? Colors.green : Colors.grey,
      ),
      title: Text(text),
      onTap: () {
        if (!isDone && isJoined) {
          _handleConfirm(context);
        }
      },
    );
  }
}
