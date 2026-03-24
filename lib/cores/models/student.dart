class Student {
  final int id;
  final String numEt;
  final String nom;
  final double? noteMath;
  final double? notePhys;
  final double? moyenne;

  const Student({
    required this.id,
    required this.numEt,
    required this.nom,
    this.noteMath,
    this.notePhys,
    this.moyenne,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    final noteMath = json['note_math'];
    final notePhys = json['note_phys'];

    return Student(
      id: json['id'],
      numEt: json['num_et'],
      nom: json['nom'],
      noteMath: noteMath != null ? (noteMath as num).toDouble() : null,
      notePhys: notePhys != null ? (notePhys as num).toDouble() : null,
      moyenne: noteMath != null && notePhys != null
          ? ((noteMath as num).toDouble() + (notePhys as num).toDouble()) / 2
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'num_et': numEt,
      'nom': nom,
      'note_math': noteMath,
      'note_phys': notePhys,
    };
  }
}