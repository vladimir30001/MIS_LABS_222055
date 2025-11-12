import 'package:flutter/material.dart';
import '../model/ispiti.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String timeUntilExam() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);
    if (difference.isNegative) {
      return "Испитот веќе е одржан.";
    } else {
      final days = difference.inDays;
      final hours = difference.inHours % 24;
      return "$days дена, $hours часа преостануваат.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Датум: ${dateFormat.format(exam.dateTime)}", style: const TextStyle(fontSize: 18)),
            Text("Време: ${timeFormat.format(exam.dateTime)}", style: const TextStyle(fontSize: 18)),
            Text("Простории: ${exam.rooms.join(", ")}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text(timeUntilExam(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
          ],
        ),
      ),
    );
  }
}
