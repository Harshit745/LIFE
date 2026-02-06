import 'package:hive/hive.dart';
import '../models/reflection_entry.dart';

class ReflectionService {
  static const String boxName = 'reflections';

  static Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<ReflectionEntry>(boxName);
    }
  }

  static Box<ReflectionEntry> get box =>
      Hive.box<ReflectionEntry>(boxName);

  static void addReflection(ReflectionEntry entry) {
    box.add(entry);
  }

  static List<ReflectionEntry> getAll() {
    return box.values.toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }
}
