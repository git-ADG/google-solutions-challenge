import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_solutions_challenge/pages/experiment_page/experiment_page.dart';
import 'package:google_solutions_challenge/pages/homepage/homepage.dart';
import 'package:google_solutions_challenge/pages/login_page/login_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}
