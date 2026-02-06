import 'package:hive/hive.dart';

part 'reflection_entry.g.dart';

@HiveType(typeId: 0)
class ReflectionEntry {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final int energy;

  @HiveField(2)
  final int focus;

  @HiveField(3)
  final int distraction;

  @HiveField(4)
  final int clarity;

  @HiveField(5)
  final String note;

  ReflectionEntry({
    required this.date,
    required this.energy,
    required this.focus,
    required this.distraction,
    required this.clarity,
    required this.note,
  });

  int get index {
    final score =
        (energy + focus + clarity + (6 - distraction)) / 4;
    return (score * 20).round();
  }
}
