import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart';
import 'package:internship_app/feature/Tool/bloc/tool_bloc.dart';

class TaskTools extends StatelessWidget {
  final List<TaskTool> tools;
  const TaskTools({super.key, required this.tools});
  void _handleReturn(BuildContext context, TaskTool tool) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Konfirmasi Pengembalian'),
        content:
            Text('Kembalikan "${tool.tool?.namaAlat}" (${tool.qty} item)?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primary)),
            onPressed: () {
              Navigator.pop(context);

              context.read<ToolBloc>().add(BringBackTool(toolId: tool.toolId));
            },
            child: const Text(
              'Kembalikan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tools.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 3.5,
      ),
      itemBuilder: (context, index) {
        final tool = tools[index];
        final isAvailable = tool.status == 1;
        return _ToolCard(
          name: tool.tool!.namaAlat,
          isAvailable: isAvailable,
          qty: tool.qty,
          onTap: () => _handleReturn(context, tool),
        );
      },
    );
  }
}

class _ToolCard extends StatelessWidget {
  final String name;
  final bool isAvailable;
  final int qty;
  final VoidCallback onTap;

  const _ToolCard({
    required this.name,
    required this.isAvailable,
    required this.qty,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isAvailable ? Colors.green[50] : Colors.red[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isAvailable ? Colors.green : Colors.red,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isAvailable ? Icons.login : Icons.logout,
              color: isAvailable ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '$name / $qty item',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isAvailable ? Colors.black87 : Colors.red[800],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
