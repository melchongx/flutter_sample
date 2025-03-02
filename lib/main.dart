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
        primaryColor: const Color(0xFF28356C), // Updated blue shade
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xE0E35559), // Updated slightly red (pinkish shade)
          background: const Color(0xFFF5F5F5), // Light background color
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
          titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Changed from blue to black
        ),
      ),


      home: const HomePage(),
    );
  }
}
