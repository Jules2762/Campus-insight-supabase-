import 'package:flutter/material.dart';
import 'package:projet_m2/features/layouts/main_layout.dart';
import 'package:projet_m2/features/pages/add_student_page.dart';

class AppRoutes{
  static final Map<String,WidgetBuilder> routes={
    '/':(context)=> MainLayout(),
    '/add-student':(context)=> AddStudentPage(),
    
  };
}