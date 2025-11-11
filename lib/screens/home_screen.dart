import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import '../screens/exam_detail_screen.dart';
import '../data/exams.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // sort chronologically by date
    final List<Exam> sorted = [...kExams]..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - 221197'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: sorted.length,
        itemBuilder: (context, i) {
          final exam = sorted[i];
          return ExamCard(
            exam: exam,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 56,
        child: Center(
          child: Chip(
            label: Text('Вкупно испити: ${sorted.length}'),
            avatar: const Icon(Icons.format_list_bulleted),
          ),
        ),
      ),
    );
  }
}
