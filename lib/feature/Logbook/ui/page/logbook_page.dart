import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/image_helper.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:intl/intl.dart';
import 'package:internship_app/feature/Logbook/bloc/logbook_bloc.dart';
import 'package:timelines/timelines.dart';

class LogbookPage extends StatefulWidget {
  const LogbookPage({super.key});

  @override
  State<LogbookPage> createState() => _LogbookPageState();
}

class _LogbookPageState extends State<LogbookPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(
          () {}); // Supaya rebuild dan filter ulang logbook saat tab berubah
    });
    log('$_tabController');

    context.read<LogbookBloc>().add(LoadCurrentLogbook());
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  }

  String _fixImageUrl(String url) {
    log(url);
    return url.replaceFirst(
      'http://localhost/public/logbooks/logbooks/',
      'http://localhost/storage/logbooks/',
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
            child: BlocBuilder<LogbookBloc, LogbookState>(
              builder: (context, state) {
                if (state is LogbookLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LogbookLoaded) {
                  final logbooks = state.logbooks;
                  final filteredLogbooks = _tabController.index == 0
                      ? logbooks.where((logbook) => !logbook.status).toList()
                      : logbooks.where((logbook) => logbook.status).toList();

                  return RefreshIndicator(
                    onRefresh: () async {
                      showSuccessToast(
                          context, 'Berhasil load ulang data workspace!');
                      context.read<LogbookBloc>().add(LoadCurrentLogbook());
                      await Future.delayed(const Duration(milliseconds: 500));
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          filteredLogbooks.isEmpty
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
                                          'Workspace Disetujui Kosong !',
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
                                  itemCount: filteredLogbooks.length,
                                  itemBuilder: (context, index) {
                                    final logbook = filteredLogbooks[index];

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
                                        title: Text(logbook.namaKegiatan),
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
                                                    text: logbook.status
                                                        ? 'Disetujui'
                                                        : 'Menunggu',
                                                    style: TextStyle(
                                                      color: logbook.status
                                                          ? Colors.green
                                                          : Colors.orange,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' • ${_formatDate(logbook.createdAt)}',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: UniversalNetworkImage(
                                                    url:
                                                        '${AppConstants.baseStorage}/${logbook.user.picture}',
                                                    width: 40,
                                                    height: 40,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  logbook.user.name,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  ', ${logbook.user.siswa!.asalSekolah}',
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (logbook.logbookVerifikasi !=
                                                null) ...[
                                              const SizedBox(height: 4),
                                              Row(
                                                children: List.generate(
                                                  logbook.logbookVerifikasi!
                                                      .rating,
                                                  (index) => const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                      size: 16),
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                        trailing: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (!logbook
                                                .status) // hanya tampil jika belum disetujui
                                              ElevatedButton(
                                                onPressed: () =>
                                                    _handleVerifikasi(
                                                        context, logbook),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12,
                                                      vertical: 12),
                                                  minimumSize: Size.zero,
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  textStyle: const TextStyle(
                                                      fontSize: 11),
                                                ),
                                                child: const Text(
                                                  'Verifikasi',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            const SizedBox(height: 4),
                                            const Icon(Icons.chevron_right),
                                          ],
                                        ),
                                        onTap: () => _showDetailBottomSheet(
                                            context, logbook),
                                      ),
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                  );
                } else if (state is LogbookError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return const Center(
                      child: Text('Tidak ada data aktifitas .'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailBottomSheet(BuildContext context, dynamic logbook) {
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
                logbook.namaKegiatan,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              const Text(
                'Permasalahan:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(logbook.permasalahan),
              const SizedBox(height: 8),
              const Text(
                'Solusi:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(logbook.solusi),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status: ${logbook.status ? 'Disetujui' : 'Menunggu'}',
                    style: TextStyle(
                      color: logbook.status ? Colors.green : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_formatDate(logbook.createdAt)),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  _fixImageUrl(logbook.foto),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Mentor: ${logbook.mentor.name}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16),
              if (logbook.logbookVerifikasi != null) ...[
                const SizedBox(height: 24),
                const Text(
                  'Verifikasi Workspace',
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
                            Text(logbook.logbookVerifikasi.mentor.name),
                          ]),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  size: 16, color: Colors.orange),
                              const SizedBox(width: 4),
                              Text(
                                  'Rating: ${logbook.logbookVerifikasi.rating}/5'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Catatan: ${logbook.logbookVerifikasi.keterangan}',
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

  void _handleVerifikasi(BuildContext context, dynamic logbook) {
    final TextEditingController _keteranganController = TextEditingController();
    double _rating = 3;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding:
            MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(16)),
        child: StatefulBuilder(
          builder: (context, setState) => SingleChildScrollView(
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
                  logbook.namaKegiatan,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                const Text('Permasalahan:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(logbook.permasalahan),
                const SizedBox(height: 8),
                const Text('Solusi:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(logbook.solusi),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status: ${logbook.status ? 'Disetujui' : 'Menunggu'}',
                      style: TextStyle(
                        color: logbook.status ? Colors.green : Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(_formatDate(logbook.createdAt)),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    _fixImageUrl(logbook.foto),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Mentor: ${logbook.mentor.name}',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 16),
                const Text('Rating:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Slider(
                  value: _rating,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: _rating.toStringAsFixed(0),
                  onChanged: (value) => setState(() {
                    _rating = value;
                  }),
                ),
                const SizedBox(height: 12),
                const Text('Catatan:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _keteranganController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan catatan/verifikasi tambahan',
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Verifikasi',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      final keterangan = _keteranganController.text.trim();

                      context.read<LogbookBloc>().add(VerifikasiLogbook(
                          logbookId: logbook.id,
                          rating: _rating,
                          keterangan: keterangan));

                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
