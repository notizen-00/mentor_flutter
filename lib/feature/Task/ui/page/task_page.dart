import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:internship_app/feature/Task/ui/page/task_detail_page.dart';
import 'package:intl/intl.dart';
import 'package:internship_app/feature/Task/bloc/task_bloc.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Supaya rebuild dan filter ulang Task saat tab berubah
    });
    log('$_tabController');

    context.read<TaskBloc>().add(LoadCurrentTask());
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Pastikan untuk dispose TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          // TabBar untuk memilih status
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Active'),
              Tab(text: 'Closed'),
            ],
          ),
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TaskLoaded) {
                  final tasks = state.tasks;
                  final filteredTasks = _tabController.index == 0
                      ? tasks.where((task) => task.status != 1).toList()
                      : tasks.where((task) => task.status == 1).toList();

                  return RefreshIndicator(
                    onRefresh: () async {
                      showSuccessToast(
                          context, 'Berhasil load ulang data Task!');
                      context.read<TaskBloc>().add(LoadCurrentTask());
                      await Future.delayed(const Duration(milliseconds: 500));
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          filteredTasks.isEmpty
                              ? Container(
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: const Padding(
                                    padding: EdgeInsets.all(90),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.info_outline,
                                            color: Colors.red, size: 48),
                                        SizedBox(height: 12),
                                        Text(
                                          'Task Closed Kosong !',
                                          style: TextStyle(color: Colors.red),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: filteredTasks.length,
                                  itemBuilder: (context, index) {
                                    final task = filteredTasks[index];

                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.blue),
                                      ),
                                      child: ListTile(
                                          iconColor: Colors.blueAccent,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 10,
                                          ),
                                          title: Text(task.namaTask),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 4),
                                              RichText(
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: task.status == 1
                                                          ? 'Closed'
                                                          : 'Active',
                                                      style: TextStyle(
                                                        color: task.status == 1
                                                            ? Colors.red
                                                            : Colors.green,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          ' • ${_formatDate(task.createdAt)}',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  const Icon(Icons.person,
                                                      size: 16,
                                                      color: Colors.grey),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    task.mentor.name,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          trailing:
                                              const Icon(Icons.chevron_right),
                                          onTap: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TaskDetailPage()))),
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                  );
                } else if (state is TaskError) {
                  return RefreshIndicator(
                      onRefresh: () async {
                        showSuccessToast(
                            context, 'Berhasil load ulang data Task!');
                        context.read<TaskBloc>().add(LoadCurrentTask());
                        await Future.delayed(const Duration(milliseconds: 500));
                      },
                      child: Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ));
                } else {
                  return const Center(child: Text('Tidak ada data Task.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
