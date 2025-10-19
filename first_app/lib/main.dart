import 'package:flutter/material.dart';
import 'pages/Onboarding.dart';
import 'pages/home.dart';

void main() {
  runApp(const MovieBookingApp());
}

class MovieBookingApp extends StatelessWidget {
  const MovieBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Booking App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Onboarding(),
    );
  }
}
