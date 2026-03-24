import 'package:flutter/material.dart';
import 'package:projet_m2/cores/services/api_service.dart';
import 'package:projet_m2/cores/states/student_stats_state.dart';
import 'package:projet_m2/features/widgets/custom_scaffold.dart';
import 'package:projet_m2/features/widgets/forms/button.dart';
import 'package:projet_m2/features/widgets/forms/input_form.dart';
import 'package:provider/provider.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numEtController = TextEditingController();
  final TextEditingController noteMathController = TextEditingController();
  final TextEditingController notePhysController = TextEditingController();

  bool loading = false;

  @override
  void dispose() {
    nameController.dispose();
    numEtController.dispose();
    noteMathController.dispose();
    notePhysController.dispose();
    super.dispose();
  }

  Future<void> addStudent() async {
    if (!formKey.currentState!.validate()) return;

    setState(() {
      loading = true;
    });

    try {
      final math = double.parse(noteMathController.text.trim());
      final phys = double.parse(notePhysController.text.trim());

      await ApiService().addStudent(
        numEtController.text.trim(),
        nameController.text.trim(),
        math,
        phys,
      );

      if (!mounted) return;

      context.read<StudentStatsState>().fetchData();

      nameController.clear();
      numEtController.clear();
      noteMathController.clear();
      notePhysController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Etudiant ajouté avec succès"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erreur : $e"),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    } finally {
      if (!mounted) return;

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Ajout étudiant",
      body: Form(
        key: formKey,
        child: Column(
          children: [
            InputForm(
              label: "Nom",
              controller: nameController,
              icon: Icons.person,
            ),

            const SizedBox(height: 15),

            InputForm(
              label: "Matricule",
              controller: numEtController,
              icon: Icons.badge,
            ),

            const SizedBox(height: 15),

            InputForm(
              label: "Note Mathématique",
              controller: noteMathController,
              icon: Icons.calculate,
            ),

            const SizedBox(height: 15),

            InputForm(
              label: "Note Physique",
              controller: notePhysController,
              icon: Icons.science,
            ),

            const SizedBox(height: 20),

            Button(
              loading: loading,
              text: "Ajouter",
              onPressed: addStudent,
            ),
          ],
        ),
      ),
    );
  }
}