import 'package:flutter/material.dart';
import 'ekrani/popis_ekran.dart';

void main() {
  runApp(const ObjaveApp());
}

class ObjaveApp extends StatelessWidget {
  const ObjaveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Objave',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3157A4),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F6FA),
          foregroundColor: Color(0xFF17233D),
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const PopisEkran(),
    );
  }
}
