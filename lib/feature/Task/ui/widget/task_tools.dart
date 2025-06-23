import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart';
import 'package:internship_app/feature/Tool/bloc/tool_bloc.dart';

class TaskTools extends StatelessWidget {
  final List<TaskTool> tools;
  final bool isJoined;

  const TaskTools({super.key, required this.tools, required this.isJoined});

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
              backgroundColor: WidgetStatePropertyAll(AppColors.primary),
            ),
            onPressed: () {
              Navigator.pop(context);
              context.read<ToolBloc>().add(BringBackTool(toolId: tool.toolId));
            },
            child:
                const Text('Kembalikan', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final borrowedTools = tools.where((tool) => tool.status == 1).toList();
    final returnedTools = tools.where((tool) => tool.status != 1).toList();

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Dipinjam'),
              Tab(text: 'Dikembalikan'),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180, // adjust height based on needs
            child: TabBarView(
              children: [
                _buildToolGrid(context, borrowedTools, true),
                _buildToolGrid(context, returnedTools, false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolGrid(
      BuildContext context, List<TaskTool> toolList, bool canReturn) {
    if (toolList.isEmpty) {
      return const Center(child: Text("Tidak ada alat."));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: toolList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 3.5,
      ),
      itemBuilder: (context, index) {
        final tool = toolList[index];
        return _ToolCard(
          name: tool.tool!.namaAlat,
          isAvailable: tool.status == 1,
          qty: tool.qty,
          onTap:
              isJoined && canReturn ? () => _handleReturn(context, tool) : null,
        );
      },
    );
  }
}

class _ToolCard extends StatelessWidget {
  final String name;
  final bool isAvailable;
  final int qty;
  final VoidCallback? onTap;

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
