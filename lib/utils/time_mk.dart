String pluralMk(int value, String one, String many) => value == 1 ? one : many;

String formatDaysHoursMk(Duration d) {
  final totalHours = d.inHours.abs();
  final days = totalHours ~/ 24;
  final hours = totalHours % 24;

  final dWord = pluralMk(days, 'ден', 'дена');
  final hWord = pluralMk(hours, 'час', 'часа');
  return '$days $dWord, $hours $hWord';
}
