import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:intl/intl.dart';
import 'package:internship_app/feature/Informasi/bloc/informasi_bloc.dart';

class InformasiPage extends StatefulWidget {
  const InformasiPage({super.key});

  @override
  State<InformasiPage> createState() => _InformasiPageState();
}

class _InformasiPageState extends State<InformasiPage> {
  @override
  void initState() {
    super.initState();
    context.read<InformasiBloc>().add(LoadCurrentInformasi());
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: BlocBuilder<InformasiBloc, InformasiState>(
        builder: (context, state) {
          if (state is InformasiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is InformasiLoaded) {
            final informasis = state.informasis;

            return RefreshIndicator(
              onRefresh: () async {
                showSuccessToast(
                    context, 'Berhasil load ulang data informasi!');
                context.read<InformasiBloc>().add(LoadCurrentInformasi());
                await Future.delayed(const Duration(milliseconds: 500));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    informasis.isEmpty
                        ? Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: const Padding(
                              padding: EdgeInsets.all(90),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.info_outline,
                                      color: Colors.red, size: 48),
                                  SizedBox(height: 12),
                                  Text(
                                    'Data Informasi Kosong!',
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
                            itemCount: informasis.length,
                            itemBuilder: (context, index) {
                              final informasi = informasis[index];

                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.blue),
                                ),
                                child: ListTile(
                                  iconColor: Colors.blueAccent,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  title: Text(informasi.namaInformasi),
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
                                              text: informasi.lokasi,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.green),
                                            ),
                                            TextSpan(
                                              text:
                                                  ' • ${_formatDate(informasi.createdAt)}',
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.info,
                                              size: 16, color: Colors.grey),
                                          const SizedBox(width: 4),
                                          Text(
                                            informasi.deskripsi,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () => _showDetailBottomSheet(
                                      context, informasi),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            );
          } else if (state is InformasiError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(child: Text('Tidak ada data aktivitas.'));
          }
        },
      ),
    );
  }

  void _showDetailBottomSheet(BuildContext context, dynamic informasi) {
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
                informasi.namaInformasi,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              const Text(
                'Permasalahan:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(informasi.deskripsi),
              const SizedBox(height: 8),
              const Text(
                'Jadwal:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(informasi.jadwalInformasi),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
