import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:projet_m2/cores/states/student_stats_state.dart';
import 'package:projet_m2/features/widgets/main_container.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    final moyenne = context.watch<StudentStatsState>().moyenne;
    final min = context.watch<StudentStatsState>().minimum;
    final max = context.watch<StudentStatsState>().maximum;

    return MainContainer(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  const Text(
                    "Statistiques de la classe",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 280,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 4,
                        centerSpaceRadius: 40,
                        sections: [
                          PieChartSectionData(
                            value: moyenne == 0 ? 1 : moyenne,
                            title: "Moy\n${moyenne.toStringAsFixed(2)}",
                            radius: 60,
                            color: Colors.blue,
                          ),
                          PieChartSectionData(
                            value: min == 0 ? 1 : min,
                            title: "Min\n${min.toStringAsFixed(2)}",
                            radius: 60,
                            color: Colors.red,
                          ),
                          PieChartSectionData(
                            value: max == 0 ? 1 : max,
                            title: "Max\n${max.toStringAsFixed(2)}",
                            radius: 60,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Indicator(label: "Moyenne", color: Colors.blue),
                      SizedBox(height: 5),
                      Indicator(label: "Minimum", color: Colors.red),
                      SizedBox(height: 5),
                      Indicator(label: "Maximum", color: Colors.green),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildValue("Moy", moyenne),
                      _buildValue("Min", min),
                      _buildValue("Max", max),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildValue(String title, double value) {
    return Column(
      children: [
        Text(
          value.toStringAsFixed(2),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String label;

  const Indicator({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: color,
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}