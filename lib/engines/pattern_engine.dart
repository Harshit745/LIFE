import '../models/reflection_entry.dart';

class WeakPattern {
  final String label;
  final int averageIndex;

  WeakPattern(this.label, this.averageIndex);
}

class PatternEngine {
  static WeakPattern? weakestDay(List<ReflectionEntry> entries) {
    if (entries.isEmpty) return null;

    final map = <int, List<int>>{};

    for (final e in entries) {
      map.putIfAbsent(e.date.weekday, () => []).add(e.index);
    }

    int? worstDay;
    double worstAvg = double.infinity;

    map.forEach((day, values) {
      final avg = values.reduce((a, b) => a + b) / values.length;
      if (avg < worstAvg) {
        worstAvg = avg;
        worstDay = day;
      }
    });

    if (worstDay == null) return null;

    return WeakPattern(
      _dayName(worstDay!),
      worstAvg.round(),
    );
  }

  static String _dayName(int d) {
    const days = [
      'Monday', 'Tuesday', 'Wednesday',
      'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    return days[d - 1];
  }
}
