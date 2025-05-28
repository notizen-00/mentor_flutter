import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:intl/intl.dart';
import 'package:internship_app/feature/Task/bloc/task_bloc.dart';
import 'package:timelines/timelines.dart';

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

  String _fixImageUrl(String url) {
    log(url);
    return url.replaceFirst(
      'http://localhost/public/Tasks/Tasks/',
      'http://localhost/storage/Tasks/',
    );
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
              Tab(text: 'Menunggu'),
              Tab(text: 'Disetujui'),
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
                      ? tasks.where((task) => task.status == 1).toList()
                      : tasks.where((task) => task.status != 1).toList();

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
                                          'Task Disetujui Kosong !',
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
                                        title: Text(task.mentor.name),
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
                                                        ? 'Disetujui'
                                                        : 'Menunggu',
                                                    style: TextStyle(
                                                      color: task.status == 1
                                                          ? Colors.green
                                                          : Colors.orange,
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
                                        onTap: () => _showDetailBottomSheet(
                                            context, task),
                                      ),
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                  );
                } else if (state is TaskError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
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

  void _showDetailBottomSheet(BuildContext context, dynamic Task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Text(
                Task.namaKegiatan,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              const Text(
                'Permasalahan:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(Task.permasalahan),
              const SizedBox(height: 8),
              const Text(
                'Solusi:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(Task.solusi),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status: ${Task.status ? 'Disetujui' : 'Menunggu'}',
                    style: TextStyle(
                      color: Task.status ? Colors.green : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_formatDate(Task.createdAt)),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  _fixImageUrl(Task.foto),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Mentor: ${Task.mentor.name}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16),
              if (Task.TaskVerifikasi != null) ...[
                const SizedBox(height: 24),
                const Text(
                  'Verifikasi Task',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: 0,
                    color: Colors.green,
                    indicatorTheme: const IndicatorThemeData(
                      position: 0,
                      size: 20,
                    ),
                    connectorTheme: const ConnectorThemeData(
                      thickness: 2.5,
                    ),
                  ),
                  builder: TimelineTileBuilder.connected(
                    connectionDirection: ConnectionDirection.before,
                    itemCount: 1,
                    contentsBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Diverifikasi:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Row(children: [
                            const Icon(Icons.person),
                            Text(Task.TaskVerifikasi.mentor.name),
                          ]),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  size: 16, color: Colors.orange),
                              const SizedBox(width: 4),
                              Text('Rating: ${Task.TaskVerifikasi.rating}/5'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Catatan: ${Task.TaskVerifikasi.keterangan}',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                    indicatorBuilder: (_, index) => const DotIndicator(
                      color: Colors.green,
                      child: Icon(Icons.check, color: Colors.white, size: 12),
                    ),
                    connectorBuilder: (_, index, ___) =>
                        const SolidLineConnector(color: Colors.green),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
