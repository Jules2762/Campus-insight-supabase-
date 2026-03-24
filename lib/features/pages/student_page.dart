import 'package:flutter/material.dart';
import 'package:projet_m2/cores/models/student.dart';
import 'package:projet_m2/cores/services/api_service.dart';
import 'package:projet_m2/cores/states/student_stats_state.dart';
import 'package:projet_m2/cores/themes/theme_color.dart';
import 'package:projet_m2/features/widgets/input.dart';
import 'package:projet_m2/features/widgets/main_container.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final TextEditingController inputSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      context.read<StudentStatsState>().fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<StudentStatsState>().fetchData();
          await context.read<StudentStatsState>().students;
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Input(
                prefixIcon: Icons.search,
                showBorder: true,
                controller: inputSearchController,
              ),

              const SizedBox(height: 10),

              FutureBuilder<List<Student>>(
                future: context.watch<StudentStatsState>().students,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  final students = snapshot.data ?? [];

                  if (students.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Aucun étudiant trouvé"),
                    );
                  }

                  return Column(
                    children: [
                      ListView.builder(
                        itemCount: students.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return StudentCard(student: students[index]);
                        },
                      ),

                      ResumeCard(
                        moyTotal: context.watch<StudentStatsState>().moyenne,
                        minMoyenne: context.watch<StudentStatsState>().minimum,
                        maxMoyenne: context.watch<StudentStatsState>().maximum,
                        admisCount: context.watch<StudentStatsState>().admis,
                        echecCount: context.watch<StudentStatsState>().echecs,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ThemeColor.primary.withAlpha(40),
                        radius: 20,
                        child: Text(
                          student.nom.substring(0, 2).toUpperCase(),
                          style: TextStyle(color: ThemeColor.primary),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.nom,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            student.numEt,
                            style: const TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),

                      IconButton(
                        onPressed: () async {
                          try {
                            await ApiService().deleteStudent(student.id);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Etudiant supprimé avec succès"),
                                backgroundColor: Colors.green,
                              ),
                            );

                            context.read<StudentStatsState>().fetchData();
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Erreur : $e"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Divider(),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "MATH",
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w900,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "${student.noteMath?.toStringAsFixed(2) ?? 0}/20",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "PHYSIQUE",
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w900,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "${student.notePhys?.toStringAsFixed(2) ?? 0}/20",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StudentStatus(
                    status: (student.moyenne ?? 0) >= 10 ? "Admis" : "Echecs",
                  ),
                  Text(
                    "Moyenne: ${(student.moyenne ?? 0).toStringAsFixed(2)}/20",
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}

class StudentStatus extends StatelessWidget {
  final String status;

  const StudentStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: status == "Admis" ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 5),
        Text(
          status,
          style: TextStyle(
            color: status == "Admis" ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}

class ResumeCard extends StatelessWidget {
  final double moyTotal;
  final double maxMoyenne;
  final double minMoyenne;
  final int admisCount;
  final int echecCount;

  const ResumeCard({
    super.key,
    this.admisCount = 0,
    this.echecCount = 0,
    this.maxMoyenne = 0,
    this.minMoyenne = 0,
    this.moyTotal = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeColor.primary.withAlpha(30),
        border: Border.all(
          color: ThemeColor.primary.withAlpha(80),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.table_chart, color: ThemeColor.primary),
              const SizedBox(width: 10),
              Text(
                "Résumé de la classe",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ThemeColor.primary,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildValue(moyTotal.toStringAsFixed(2), "MOY"),
              _buildValue(maxMoyenne.toStringAsFixed(2), "MAX"),
              _buildValue(minMoyenne.toStringAsFixed(2), "MIN"),
            ],
          ),

          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildValue(admisCount.toString(), "ADMIS"),
              _buildValue(echecCount.toString(), "ECHECS"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildValue(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 10,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}