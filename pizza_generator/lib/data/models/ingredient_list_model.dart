import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizza_generator/data/models/ingredient_model.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';

part 'ingredient_list_model.freezed.dart';
part 'ingredient_list_model.g.dart';

@freezed
class IngredientListModel with _$IngredientListModel {
  const factory IngredientListModel({
    required List<IngredientModel> ingredients,
  }) = _IngredientListModel;

  const IngredientListModel._();

  factory IngredientListModel.fromJson(Map<String, Object?> json) =>
      _$IngredientListModelFromJson(json);

  factory IngredientListModel.fromDomain(List<Ingredient> ingredients) =>
      IngredientListModel(
        ingredients: ingredients
            .map(
              IngredientModel.fromDomain,
            )
            .toList(),
      );

  List<Ingredient> toDomain() => ingredients
      .map(
        (e) => e.toDomain(),
      )
      .toList();
}
