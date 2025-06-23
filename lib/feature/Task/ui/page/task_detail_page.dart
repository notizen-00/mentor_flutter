import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/services/service_locator.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/core/utils/siswa_manager.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:internship_app/feature/Task/bloc/task_bloc.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart';
import 'package:internship_app/feature/Task/ui/widget/task_schema.dart';
import 'package:internship_app/feature/Task/ui/widget/task_tools.dart';
import 'package:internship_app/feature/Tool/bloc/tool_bloc.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});
  double _calculateProgress(List<TaskSchema> schemas) {
    if (schemas.isEmpty) return 0.0;

    final completed = schemas.where((e) => e.status == 1).length;
    return completed / schemas.length;
  }

  @override
  Widget build(BuildContext context) {
    void addTaskTool(BuildContext context, TaskModel task) {
      final toolState = context.read<ToolBloc>().state;

      if (toolState is! ToolLoaded) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Alat belum tersedia')),
        );
        return;
      }

      final tools = toolState.tools;
      final selectedToolIds = <int>{}; // set of selected tool IDs

      showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text('Pilih alat untuk "${task.namaTask}"'),
                content: SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: tools.length,
                    itemBuilder: (context, index) {
                      final tool = tools[index];
                      final isSelected = selectedToolIds.contains(tool.id);

                      return CheckboxListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child:
                                  Text('${tool.namaAlat} (${tool.qty} item)'),
                            ),
                            Text(
                              tool.qty > 0 ? 'Tersedia' : 'Tidak tersedia',
                              style: TextStyle(
                                color: tool.qty > 0 ? Colors.green : Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        value: isSelected,
                        onChanged: tool.qty == 0
                            ? null
                            : (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    selectedToolIds.add(tool.id);
                                  } else {
                                    selectedToolIds.remove(tool.id);
                                  }
                                });
                              },
                      );
                    },
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                  ElevatedButton(
                    onPressed: selectedToolIds.isEmpty
                        ? null
                        : () {
                            Navigator.pop(context);

                            context.read<TaskBloc>().add(AssignToolsToTask(
                                taskId: task.id,
                                selectedToolIds: selectedToolIds.toList()));
                            context.read<ToolBloc>().add(LoadCurrentTool());
                            showInfoToast(context, 'sukses menambah alat !');
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Selesai',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            if (state is JoinTaskSuccess) {
              showSuccessToast(context, "Berhasil bergabung ke dalam task!");
              context.read<TaskBloc>().add(LoadCurrentTask());
              Navigator.pop(context);
            } else if (state is JoinTaskFailure) {
              showErrorToast(context, state.message);
              context.read<TaskBloc>().add(LoadCurrentTask());
              Navigator.pop(context);
            } else if (state is TaskError) {
              showErrorToast(context, state.message);
            }
          },
        ),
        BlocListener<ToolBloc, ToolState>(
          listener: (context, state) {
            if (state is ToolBackSuccess) {
              showSuccessToast(context, "Alat berhasil dikembalikan!");
              context.read<TaskBloc>().add(LoadDetailTask(state.task));
            } else if (state is ToolError) {
              showErrorToast(context, state.message);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              context.read<TaskBloc>().add(LoadCurrentTask());
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: AppColors.primary,
          title: const Text(
            'Detail Task Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is DetailTaskLoaded) {
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.task.namaTask,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    // Status & Priority
                    Row(
                      children: [
                        _buildChip(
                          state.task.status == 1 ? 'Closed' : 'Active',
                          state.task.status != 1 ? Colors.red : Colors.green,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Tools
                    const Text('Lokasi',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(state.task.location.namaLokasi),
                    const SizedBox(height: 16),

                    const SizedBox(height: 16),

                    // Description
                    const Text('Description',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(state.task.keterangan!),
                    const SizedBox(height: 16),

                    // Assignee
                    const Text('User Task',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(
                        state.task.taskUser!.length,
                        (index) {
                          final user = state.task.taskUser![index].user;
                          final imageUrl = user?.picture != null
                              ? '${AppConstants.baseStorage}/${user?.picture}'
                              : null;

                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Tooltip(
                              message: user?.name,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[200],
                                backgroundImage: imageUrl != null
                                    ? NetworkImage(imageUrl)
                                    : null,
                                child: imageUrl == null
                                    ? const Icon(Icons.person, size: 20)
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),
                    if (state.task.taskTool!.isNotEmpty)
                      ListTile(
                        tileColor: AppColors.primary,
                        title: const Text(
                          'Task Tools',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: const Text(
                          'list alat yang di pinjam !',
                          style: TextStyle(color: Colors.white54),
                        ),
                        trailing: GestureDetector(
                          child: const Icon(
                            Icons.history,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        TaskTools(
                            tools: state.task.taskTool!,
                            isJoined: state.alreadyJoined),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.blue.shade100),
                              surfaceTintColor:
                                  const WidgetStatePropertyAll(Colors.red),
                            ),
                            onPressed: () {
                              if (state.alreadyJoined) {
                                context.read<ToolBloc>().add(LoadCurrentTool());
                                addTaskTool(context, state.task);
                              } else {
                                showErrorToast(
                                    context, 'Anda bukan bagian dari task ini');
                              }
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text('Tambah Alat'),
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      tileColor: AppColors.primary,
                      title: const Text(
                        'Task Progress',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: const Text(
                        'mohon update progres secara berkala !',
                        style: TextStyle(color: Colors.white30),
                      ),
                      trailing: GestureDetector(
                        child: const Icon(
                          Icons.history,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TaskProgressList(
                            schemas: state.task.taskSchema,
                            isJoined: state.alreadyJoined),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: _calculateProgress(state.task.taskSchema),
                          minHeight: 6,
                          backgroundColor: Colors.grey[300],
                          color: Colors.green,
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Text('Persentase Progress : '),
                        const SizedBox(width: 8),
                        Text(
                            '${(_calculateProgress(state.task.taskSchema) * 100).toStringAsFixed(0)}%'),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text('Lorem Ipsum dulz',
                              style: TextStyle(color: Colors.red)),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            } else if (state is TaskError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        color: Colors.red, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<TaskBloc>().add(LoadCurrentTask());
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Coba Lagi'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            final state = context.watch<TaskBloc>().state;

            if (state is DetailTaskLoaded) {
              return FutureBuilder(
                future: sl<SiswaManager>().getSiswa(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox();
                  }

                  final alreadyJoined = state.task.taskUser!
                      .any((taskUser) => taskUser.userId == snapshot.data?.id);
                  log('status $alreadyJoined');
                  log('user id mu ${snapshot.data?.id}');

                  if (!alreadyJoined) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<TaskBloc>()
                                .add(JoinTask(taskId: state.task.id));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          child: const Text(
                            "Join Task",
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            showSuccessToast(
                                context, 'Task Berhasil di tutup !');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text(
                            "Close Task",
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
