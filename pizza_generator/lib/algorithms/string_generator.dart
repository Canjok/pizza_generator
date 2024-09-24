import 'dart:math';

final class StringGenerator {
  static List<String> generateStringsFromStringList({
    required List<String> strings,
    required int count,
    required bool allowRepetitions,
  }) {
    if (strings.isEmpty || count <= 0) {
      return [];
    }
    if (!allowRepetitions && strings.length <= count) {
      return strings;
    }
    final length = strings.length;
    final randomGenerator = Random();
    final indexList = List<int>.empty(growable: true);
    for (var i = 0; i < count; i++) {
      final randomNumber = randomGenerator.nextInt(length);
      if (allowRepetitions) {
        indexList.add(randomNumber);
      } else if (!allowRepetitions && !indexList.contains(randomNumber)) {
        indexList.add(randomNumber);
      }
    }

    return indexList.map((e) => strings[e]).toList();
  }
}
