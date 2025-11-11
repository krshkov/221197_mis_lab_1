import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('dd.MM.yyyy').format(exam.dateTime);
    final timeStr = DateFormat('HH:mm').format(exam.dateTime);
    final color = exam.isPast
        ? Colors.grey.shade300
        : Colors.green.shade100;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Row(
          children: [
            Container(width: 6, height: 88, decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exam.subject,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.event, size: 18),
                        const SizedBox(width: 6),
                        Text('$dateStr · $timeStr'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.meeting_room, size: 18),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(exam.rooms.join(', '),
                              maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
