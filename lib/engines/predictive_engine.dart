import '../models/reflection_entry.dart';

class PredictiveEngine {
  static bool isCollapseLikely(List<ReflectionEntry> history) {
    if (history.length < 5) return false;

    final recent = history.take(5).toList();

    int drops = 0;
    for (int i = 1; i < recent.length; i++) {
      if (recent[i].index < recent[i - 1].index) {
        drops++;
      }
    }

    return drops >= 3;
  }

  static bool isMomentumBuilding(List<ReflectionEntry> history) {
    if (history.length < 3) return false;

    final recent = history.take(3).toList();

    return recent[0].index > recent[1].index &&
        recent[1].index > recent[2].index;
  }
}
