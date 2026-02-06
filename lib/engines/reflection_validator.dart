class ReflectionValidationResult {
  final bool isValid;
  final String message;

  ReflectionValidationResult(this.isValid, this.message);
}

class ReflectionValidator {
  static const _vagueWords = [
    'ok',
    'okay',
    'fine',
    'nothing',
    'normal',
    'same',
  ];

  static ReflectionValidationResult validate(String note) {
    if (note.trim().length < 40) {
      return ReflectionValidationResult(
        false,
        "Write a little more. What actually happened today?",
      );
    }

    final lower = note.toLowerCase();

    for (final word in _vagueWords) {
      if (lower == word || lower.startsWith('$word ')) {
        return ReflectionValidationResult(
          false,
          "This feels surface-level. What did you avoid today?",
        );
      }
    }

    return ReflectionValidationResult(true, "");
  }
}
