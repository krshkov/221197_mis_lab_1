import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';
import '../utils/time_mk.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('EEEE, dd MMM yyyy', 'mk'); // e.g., вторник, 12 ное 2025
    final timeFmt = DateFormat('HH:mm');

    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    final diffText = formatDaysHoursMk(diff);

    final statusText = exam.isPast
        ? 'Испитот е поминат пред $diffText'
        : 'Преостанато време: $diffText';

    return Scaffold(
      appBar: AppBar(title: const Text('Детали за испит')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exam.subject, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Row(children: [
              const Icon(Icons.event),
              const SizedBox(width: 8),
              Text(dateFmt.format(exam.dateTime)),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 8),
              Text(timeFmt.format(exam.dateTime)),
            ]),
            const SizedBox(height: 8),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.meeting_room),
              const SizedBox(width: 8),
              Expanded(child: Text(exam.rooms.join(', '))),
            ]),
            const Divider(height: 24),
            Row(
              children: [
                Icon(exam.isPast ? Icons.check_circle : Icons.hourglass_bottom,
                    color: exam.isPast ? Colors.grey : Colors.green),
                const SizedBox(width: 8),
                Text(statusText),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: FilledButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Назад'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
