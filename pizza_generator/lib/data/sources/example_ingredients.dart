import 'package:pizza_generator/data/models/ingredient_list_model.dart';
import 'package:pizza_generator/data/models/ingredient_model.dart';

final class ExampleIngredients {
  static IngredientListModel getExampleIngredientModels() {
    const firstIngredient = IngredientModel(
      name: 'Mozzarella',
      selected: true,
    );
    final secondIngredient = firstIngredient.copyWith(name: 'Salami');
    return IngredientListModel(
      ingredients: [firstIngredient, secondIngredient],
    );
  }
}
