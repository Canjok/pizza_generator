import 'package:pizza_generator/data/models/ingredient_list_model.dart';
import 'package:pizza_generator/data/models/ingredient_model.dart';
import 'package:uuid/uuid.dart';

final class ExampleIngredients {
  static IngredientListModel getExampleIngredientModels() {
    final firstIngredient = IngredientModel(
      name: 'Mozzarella',
      selected: true,
      uid: const Uuid().v1(),
    );
    final secondIngredient = IngredientModel(
      name: 'Salami',
      selected: true,
      uid: const Uuid().v1(),
    );
    return IngredientListModel(
      ingredients: [firstIngredient, secondIngredient],
    );
  }
}
