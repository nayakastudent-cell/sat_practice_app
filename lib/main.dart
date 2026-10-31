import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const SatPracticeApp());

class SatPracticeApp extends StatelessWidget {
  const SatPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF00704F);
    const pink = Color(0xFFF672C4);
    return MaterialApp(
      title: 'SAT R&W Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: green,
          primary: green,
          secondary: pink,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: pink,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: pink,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          titleMedium: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
