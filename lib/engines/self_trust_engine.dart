import '../models/reflection_entry.dart';

class SelfTrustEngine {
  static int compute(List<ReflectionEntry> entries) {
    if (entries.length < 3) return 50;

    int drops = 0;

    for (int i = 1; i < entries.length; i++) {
      if (entries[i].index < entries[i - 1].index) {
        drops++;
      }
    }

    final ratio = 1 - (drops / entries.length);
    return (ratio * 100).clamp(0, 100).round();
  }
}
