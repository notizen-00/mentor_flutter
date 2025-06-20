import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:internship_app/feature/Task/ui/page/task_detail_page.dart';
import 'package:internship_app/feature/Task/ui/widget/task_setting.dart';
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
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: Colors.blue),
                                        ),
                                        child: ListTile(
                                          leading: IconButton(
                                            icon: const Icon(Icons.settings),
                                            onPressed: () {
                                              TaskSetting.show(
                                                context,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                        'Ini konten bottom sheet',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child:
                                                            const Text('Tutup'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
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
                                                  SizedBox(
                                                    width: 90,
                                                    height:
                                                        27, // tambahkan tinggi
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          task.taskUser
                                                                  ?.length ??
                                                              0, (i) {
                                                        final user = task
                                                            .taskUser![i].user;

                                                        final pictureUrl =
                                                            '${AppConstants.baseStorage}/${user?.picture}';
                                                        final nameInitial = user
                                                                ?.name
                                                                .substring(0, 1)
                                                                .toUpperCase() ??
                                                            '?';

                                                        return Positioned(
                                                          left: i * 35.0,
                                                          child: CircleAvatar(
                                                            radius: 16,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            child: pictureUrl
                                                                    .isNotEmpty
                                                                ? ClipOval(
                                                                    child: Image
                                                                        .network(
                                                                      pictureUrl,
                                                                      width: 32,
                                                                      height:
                                                                          32,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) {
                                                                        // Fallback ke inisial jika error
                                                                        return CircleAvatar(
                                                                          radius:
                                                                              16,
                                                                          backgroundColor: Colors
                                                                              .blue
                                                                              .shade200,
                                                                          child:
                                                                              Text(
                                                                            nameInitial,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  )
                                                                : CircleAvatar(
                                                                    radius: 16,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .blue
                                                                            .shade200,
                                                                    child: Text(
                                                                      nameInitial,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          trailing:
                                              const Icon(Icons.chevron_right),
                                          onTap: () {
                                            context
                                                .read<TaskBloc>()
                                                .add(LoadDetailTask(task));
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const TaskDetailPage(),
                                              ),
                                            );
                                          },
                                        ));
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
