import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_sample_one/auth_service.dart';
import 'package:flutter_sample_one/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Ensures Firebase is initialized properly
  );
  runApp(const JobApp());
}

class JobApp extends StatelessWidget {
  const JobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JobAll Site",
      theme: ThemeData(
        primaryColor: const Color(0xFF23486A),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF5B913B),
        ),
      ),
      home: const HomePage(),
    );
  }
}
