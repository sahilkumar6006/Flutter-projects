import 'package:flutter/material.dart';
import 'screens/meme_home_page.dart';

void main() {
  runApp(const MemeApp());
}

class MemeApp extends StatelessWidget {
  const MemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meme App',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const MemeHomePage(),
    );
  }
}
