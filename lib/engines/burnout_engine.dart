import '../models/reflection_entry.dart';

class BurnoutEngine {
  static bool isBurnoutRisk(List<ReflectionEntry> entries) {
    if (entries.length < 5) return false;

    final recent = entries.takeLast(5).toList();

    final avgEnergy =
        recent.map((e) => e.energy).reduce((a, b) => a + b) / 5;

    return avgEnergy <= 2.5;
  }
}

extension TakeLast<T> on List<T> {
  Iterable<T> takeLast(int n) =>
      skip(length > n ? length - n : 0);
}
