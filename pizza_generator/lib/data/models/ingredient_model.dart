import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';

part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';

@freezed
class IngredientModel with _$IngredientModel {
  const factory IngredientModel({
    required String name,
    required bool selected,
  }) = _IngredientModel;

  const IngredientModel._();

  factory IngredientModel.fromJson(Map<String, Object?> json) =>
      _$IngredientModelFromJson(json);

  factory IngredientModel.fromDomain(Ingredient ingredient) =>
      IngredientModel(name: ingredient.name, selected: ingredient.isSelected);

  Ingredient toDomain() => Ingredient(name: name, isSelected: selected);
}
