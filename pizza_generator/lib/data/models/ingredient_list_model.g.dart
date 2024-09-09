// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientListModelImpl _$$IngredientListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientListModelImpl(
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IngredientListModelImplToJson(
        _$IngredientListModelImpl instance) =>
    <String, dynamic>{
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
    };
