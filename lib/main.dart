import 'package:flutter/material.dart';
import 'package:flutter_sample_one/pages/home_page.dart';

void main() {
  runApp(const JobApp());
}

class JobApp extends StatelessWidget {
  const JobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JobSeeker Pro",
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
