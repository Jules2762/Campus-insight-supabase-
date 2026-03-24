import 'package:flutter/material.dart';
import 'package:projet_m2/cores/states/student_stats_state.dart';
import 'package:projet_m2/routes.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vvbkulxsqtqcxtmqrjiw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ2Ymt1bHhzcXRxY3h0bXFyaml3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM5Nzc0OTIsImV4cCI6MjA4OTU1MzQ5Mn0.5tKzlcczCX4h1-kez4x_YNfCYJq0COi69938GnYlwJM',
  );

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => StudentStatsState())],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.elasticIn,
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
