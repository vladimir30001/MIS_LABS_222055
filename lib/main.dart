import 'package:flutter/material.dart';
import 'screens/ispiti_lista_screen.dart';

void main() {
  runApp(const IspitiRasporedApp());
}

class IspitiRasporedApp extends StatelessWidget {
  const IspitiRasporedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ExamListScreen(),
    );
  }
}
