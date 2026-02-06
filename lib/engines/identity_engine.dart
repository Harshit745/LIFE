import '../models/reflection_entry.dart';

class IdentityEngine {
  static bool isDrifting(List<ReflectionEntry> history) {
    if (history.length < 7) return false;

    int lowClarity = 0;

    for (final r in history.take(7)) {
      if (r.clarity <= 2) lowClarity++;
    }

    return lowClarity >= 4;
  }
}

