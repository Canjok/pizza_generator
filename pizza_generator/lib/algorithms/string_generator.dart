import 'dart:math';

final class StringGenerator {
  static List<String> generateStringsFromStringList(
    List<String> strings,
    int count,
  ) {
    if (strings.isEmpty || count <= 0) {
      return [];
    }
    final length = strings.length;
    final generatedStrings = List<String>.empty(growable: true);
    final randomGenerator = Random();
    for (var i = 0; i < count; i++) {
      final randomNumber = randomGenerator.nextInt(length);
      generatedStrings.add(strings[randomNumber]);
    }

    return generatedStrings;
  }
}
