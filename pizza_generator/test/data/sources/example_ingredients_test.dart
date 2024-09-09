import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_generator/data/models/ingredient_model.dart';
import 'package:pizza_generator/data/sources/example_ingredients.dart';

void main() {
  test('getExampleIngredients result contains correct examples', () {
    const name1 = 'Mozzarella';
    const name2 = 'Salami';
    const selected = true;

    const ingredient1 = IngredientModel(name: name1, selected: selected);
    const ingredient2 = IngredientModel(name: name2, selected: selected);

    const expected = [ingredient1, ingredient2];

    final actual = ExampleIngredients.getExampleIngredientModels();

    final isEqual = listEquals(actual.ingredients, expected);

    expect(isEqual, equals(true));
  });
}
