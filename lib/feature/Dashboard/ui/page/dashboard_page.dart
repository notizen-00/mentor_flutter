import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:internship_app/feature/Dashboard/ui/widget/task_active.dart';
import 'package:internship_app/feature/Siswa/bloc/siswa_bloc.dart';
import 'package:internship_app/feature/Siswa/ui/page/list_siswa_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.6),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 22,
              crossAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                DashboardCard(
                  title: "Staff",
                  value: "15",
                  icon: Icons.person_pin_circle_outlined,
                  color: Colors.blue,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<SiswaBloc>().add(SiswaListCheck());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListSiswaPage()),
                    );
                  },
                  child: const DashboardCard(
                    title: "Magang",
                    value: "4",
                    icon: Icons.person_pin_sharp,
                    color: Colors.green,
                  ),
                ),
                DashboardCard(
                  title: "Tools",
                  value: "21",
                  icon: Icons.inventory_2_outlined,
                  color: Colors.purple,
                ),
                DashboardCard(
                  title: "Task",
                  value: "0",
                  icon: Icons.task_outlined,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 1),

            // Info Buttons

            const SizedBox(height: 24),

            // User Statistics
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Task Active",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.more_vert),
                      ],
                    ),
                  ),

                  // Task Cards
                  TaskActiveCard(
                    title: "Check Power Usage",
                    subtitle: "Review usage for Flat 1",
                    icon: Icons.flash_on,
                    color: Colors.orange,
                  ),
                  TaskActiveCard(
                    title: "Pay Electricity Bill",
                    subtitle: "Flat 2 bill due this week",
                    icon: Icons.receipt_long,
                    color: Colors.red,
                  ),
                  TaskActiveCard(
                    title: "Analyze Cost Trend",
                    subtitle: "Compare April vs May",
                    icon: Icons.trending_up,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 44),
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black)),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.black54)),
        ],
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color color;

  const InfoButton({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12)),
                Text("$count",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LegendIndicator extends StatelessWidget {
  final String title;
  final Color color;

  const LegendIndicator({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
              width: 12,
              height: 12,
              color: color,
              margin: const EdgeInsets.only(right: 8)),
          Text(title),
        ],
      ),
    );
  }
}
