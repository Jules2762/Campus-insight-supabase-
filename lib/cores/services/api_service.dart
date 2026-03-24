import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:projet_m2/cores/models/student.dart';

class ApiService {
  final supabase = Supabase.instance.client;

  Future<List<Student>> getStudents() async {
    final data = await supabase
        .from('etudiant')
        .select()
        .order('id', ascending: false);

    return data.map<Student>((e) => Student.fromJson(e)).toList();
  }

  Future<void> addStudent(
    String numEt,
    String nom,
    double math,
    double phys,
  ) async {
    await supabase.from('etudiant').insert({
      'num_et': numEt,
      'nom': nom,
      'note_math': math,
      'note_phys': phys,
    });
  }

  Future<void> deleteStudent(int id) async {
    await supabase
        .from('etudiant')
        .delete()
        .eq('id', id);
  }

  Future<void> updateStudent(
    int id,
    String numEt,
    String nom,
    double math,
    double phys,
  ) async {
    await supabase
        .from('etudiant')
        .update({
          'num_et': numEt,
          'nom': nom,
          'note_math': math,
          'note_phys': phys,
        })
        .eq('id', id);
  }
}