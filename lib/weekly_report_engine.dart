import '../models/reflection_entry.dart';

class WeeklyNarrative {
  final String text;

  WeeklyNarrative(this.text);
}

class WeeklyReportEngine {
  static WeeklyNarrative generate(List<ReflectionEntry> all) {
    if (all.isEmpty) {
      return WeeklyNarrative("No data yet.");
    }

    final last7 =
    all.where((e) => e.date.isAfter(
      DateTime.now().subtract(const Duration(days: 7)),
    )).toList();

    final avgIndex =
        last7.map((e) => e.index).reduce((a, b) => a + b) / last7.length;

    String tone;

    if (avgIndex >= 70) {
      tone = "Strong week. Momentum is building.";
    } else if (avgIndex >= 50) {
      tone = "Mixed week. Direction exists, consistency doesn’t.";
    } else {
      tone = "Low-output week. Recovery and structure needed.";
    }

    return WeeklyNarrative(tone);
  }
}
