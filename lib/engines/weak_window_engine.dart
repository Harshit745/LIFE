import '../models/reflection_entry.dart';

class WeakWindow {
  final String label;
  final int avgIndex;

  WeakWindow(this.label, this.avgIndex);
}

class WeakWindowEngine {
  static WeakWindow? detect(List<ReflectionEntry> history) {
    if (history.length < 7) return null;

    final map = <int, List<int>>{};

    for (final r in history) {
      final hour = r.date.hour;
      map.putIfAbsent(hour, () => []).add(r.index);
    }

    int? worstHour;
    double worstAvg = double.infinity;

    map.forEach((h, values) {
      final avg = values.reduce((a, b) => a + b) / values.length;
      if (avg < worstAvg) {
        worstAvg = avg;
        worstHour = h;
      }
    });

    if (worstHour == null) return null;

    return WeakWindow(
      "${worstHour!}:00–${worstHour! + 1}:00",
      worstAvg.round(),
    );
  }
}
