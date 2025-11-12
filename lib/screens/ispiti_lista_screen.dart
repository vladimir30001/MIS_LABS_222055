import 'package:flutter/material.dart';
import '../model/ispiti.dart';
import '../widgets/ispiti_informacii.dart';
import 'ispiti_detail_screen.dart';
import 'package:intl/intl.dart';

class ExamListScreen extends StatelessWidget {
  final String indexNumber = "222055";

  ExamListScreen({super.key});

  final List<Exam> exams = [
    Exam(subjectName: "Програмирање на видео игри", dateTime: DateTime(2025, 11, 15, 9, 0), rooms: ["Лаб 13", "Лаб 215"]),
    Exam(subjectName: "Бази на податоци", dateTime: DateTime(2025, 11, 18, 10, 0), rooms: ["лаб 200В"]),
    Exam(subjectName: "Компјутерски мрежи", dateTime: DateTime(2025, 11, 21, 12, 0), rooms: ["Лаб 2", "Лаб 138"]),
    Exam(subjectName: "Оперативни системи", dateTime: DateTime(2025, 11, 25, 9, 0), rooms: ["Лаб 200АБ"]),
    Exam(subjectName: "Структурно програмирање", dateTime: DateTime(2025, 10, 20, 9, 0), rooms: ["Амфитеатар МФ"], isPassed: true),
    Exam(subjectName: "Алгоритми и податочни структури", dateTime: DateTime(2025, 11, 27, 10, 0), rooms: ["Барака 2.1"]),
    Exam(subjectName: "Веројатност", dateTime: DateTime(2025, 11, 29, 11, 30), rooms: ["Барака 2.2"]),
    Exam(subjectName: "Вовед во компјутерски науки", dateTime: DateTime(2025, 12, 1, 8, 0), rooms: ["Барака 3.1"]),
    Exam(subjectName: "Компјутерски архитектури", dateTime: DateTime(2025, 12, 3, 9, 30), rooms: ["Барака 2.2"]),
    Exam(subjectName: "Калкулус", dateTime: DateTime(2025, 12, 5, 13, 0), rooms: ["Барака 3.2"]),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text("Распоред за испити - $indexNumber"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamDetailScreen(exam: exam),
                ),
              );
            },
            child: ExamCard(exam: exam),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.all(12),
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
