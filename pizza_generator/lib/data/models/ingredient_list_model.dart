import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizza_generator/data/models/ingredient_model.dart';

part 'ingredient_list_model.freezed.dart';
part 'ingredient_list_model.g.dart';

@freezed
class IngredientListModel with _$IngredientListModel {
  const factory IngredientListModel({
    required List<IngredientModel> ingredients,
  }) = _IngredientListModel;

  factory IngredientListModel.fromJson(Map<String, Object?> json) =>
      _$IngredientListModelFromJson(json);
}
