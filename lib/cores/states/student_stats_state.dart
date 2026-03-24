import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projet_m2/cores/models/student.dart';
import 'package:projet_m2/cores/services/api_service.dart';

class StudentStatsState extends ChangeNotifier {
  double _moyenne = 0;
  double _minimum = 0;
  double _maximum = 0;
  int _admis = 0;
  int _echecs = 0;
  int _length = 0;

  double get moyenne => _moyenne;
  double get minimum => _minimum;
  double get maximum => _maximum;
  int get admis => _admis;
  int get echecs => _echecs;
  int get length => _length;

  late Future<List<Student>> _students;
  Future<List<Student>> get students => _students;

  void fetchData() {
    _students = ApiService().getStudents();

    _students.then((value) {
      _admis = 0;
      _echecs = 0;
      _moyenne = 0;
      _minimum = 0;
      _maximum = 0;
      _length = value.length;

      if (value.isNotEmpty) {
        double total = 0;

        _minimum = value.first.moyenne ?? 0;
        _maximum = value.first.moyenne ?? 0;

        for (Student s in value) {
          final m = s.moyenne ?? 0;

          total += m;
          _minimum = min(_minimum, m);
          _maximum = max(_maximum, m);

          if (m >= 10) {
            _admis++;
          } else {
            _echecs++;
          }
        }

        _moyenne = total / _length;
      }

      notifyListeners();
    });
  }
}