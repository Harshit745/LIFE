import '../models/reflection_entry.dart';

class SelfTrustEngine {
  static int compute(List<ReflectionEntry> history) {
    if (history.length < 3) return 50;

    int breaks = 0;

    for (int i = 1; i < history.length; i++) {
      if (history[i].index < history[i - 1].index) {
        breaks++;
      }
    }

    final ratio = 1 - (breaks / history.length);
    return (ratio * 100).clamp(0, 100).round();
  }
}
