import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String name,
    required String uid,
    required bool isSelected,
  }) = _Ingredient;
}
