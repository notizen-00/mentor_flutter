import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/core/utils/toast_utils.dart';
import 'package:internship_app/feature/Tool/bloc/tool_bloc.dart';
import 'package:internship_app/feature/Tool/data/model/tool_model.dart';
import 'package:internship_app/feature/Tool/ui/page/tool_detail_page.dart';

class ToolPage extends StatefulWidget {
  const ToolPage({super.key});

  @override
  State<ToolPage> createState() => _ToolPageState();
}

class _ToolPageState extends State<ToolPage> {
  bool isGridView = false;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<ToolBloc>().add(LoadCurrentTool());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ToolBloc, ToolState>(
      listener: (context, state) {
        if (state is ToolLoaded) {
          // showSuccessToast(context, 'Tool sukses di-load!');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Tool', style: TextStyle(color: Colors.white)),
          backgroundColor: AppColors.primary,
          actions: [
            IconButton(
              icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
              onPressed: () => setState(() => isGridView = !isGridView),
              tooltip: isGridView ? 'Tampilkan ListView' : 'Tampilkan GridView',
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Cari nama alat...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) =>
                    setState(() => searchQuery = value.toLowerCase()),
              ),
            ),
            Expanded(
              child: BlocBuilder<ToolBloc, ToolState>(
                builder: (context, state) {
                  if (state is ToolLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ToolError) {
                    return Center(child: Text(state.message));
                  } else if (state is ToolLoaded) {
                    final tools = state.tools.where((tool) {
                      final matchName =
                          tool.namaAlat.toLowerCase().contains(searchQuery);
                      return matchName;
                    }).toList();

                    if (tools.isEmpty) {
                      return const Center(
                          child: Text('Tidak ada alat yang cocok.'));
                    }

                    return isGridView
                        ? GridView.builder(
                            padding: const EdgeInsets.all(12),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 3 / 2,
                            ),
                            itemCount: tools.length,
                            itemBuilder: (context, index) {
                              final tool = tools[index];
                              return ToolCard(tool: tool);
                            },
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(12),
                            itemCount: tools.length,
                            itemBuilder: (context, index) {
                              final tool = tools[index];
                              return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<ToolBloc>()
                                        .add(LoadDetailTool(toolId: tool.id));
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ToolDetailPage(),
                                      ),
                                    );
                                  },
                                  child: ToolCard(
                                    tool: tool,
                                  ));
                            },
                          );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToolCard extends StatelessWidget {
  final ToolModel tool;

  const ToolCard({super.key, required this.tool});

  @override
  Widget build(BuildContext context) {
    final bool isAvailable = tool.qty > 0;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            if (tool.fotoAlat != null && tool.fotoAlat!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  tool.fotoAlat!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 60),
                ),
              )
            else
              const Icon(Icons.image_not_supported,
                  size: 60, color: Colors.grey),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tool.namaAlat,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(tool.keterangan),
                  const SizedBox(height: 4),
                  Text('Stok : ${tool.qty}'),
                  const SizedBox(height: 4),
                  Text(
                    isAvailable ? 'Status: Tersedia' : 'Status: Tidak tersedia',
                    style: TextStyle(
                        color: isAvailable ? Colors.green : Colors.red),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
