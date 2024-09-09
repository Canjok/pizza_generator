// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IngredientListModel _$IngredientListModelFromJson(Map<String, dynamic> json) {
  return _IngredientListModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientListModel {
  List<IngredientModel> get ingredients => throw _privateConstructorUsedError;

  /// Serializes this IngredientListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IngredientListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientListModelCopyWith<IngredientListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientListModelCopyWith<$Res> {
  factory $IngredientListModelCopyWith(
          IngredientListModel value, $Res Function(IngredientListModel) then) =
      _$IngredientListModelCopyWithImpl<$Res, IngredientListModel>;
  @useResult
  $Res call({List<IngredientModel> ingredients});
}

/// @nodoc
class _$IngredientListModelCopyWithImpl<$Res, $Val extends IngredientListModel>
    implements $IngredientListModelCopyWith<$Res> {
  _$IngredientListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientListModelImplCopyWith<$Res>
    implements $IngredientListModelCopyWith<$Res> {
  factory _$$IngredientListModelImplCopyWith(_$IngredientListModelImpl value,
          $Res Function(_$IngredientListModelImpl) then) =
      __$$IngredientListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<IngredientModel> ingredients});
}

/// @nodoc
class __$$IngredientListModelImplCopyWithImpl<$Res>
    extends _$IngredientListModelCopyWithImpl<$Res, _$IngredientListModelImpl>
    implements _$$IngredientListModelImplCopyWith<$Res> {
  __$$IngredientListModelImplCopyWithImpl(_$IngredientListModelImpl _value,
      $Res Function(_$IngredientListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of IngredientListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
  }) {
    return _then(_$IngredientListModelImpl(
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientListModelImpl implements _IngredientListModel {
  const _$IngredientListModelImpl(
      {required final List<IngredientModel> ingredients})
      : _ingredients = ingredients;

  factory _$IngredientListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientListModelImplFromJson(json);

  final List<IngredientModel> _ingredients;
  @override
  List<IngredientModel> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'IngredientListModel(ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ingredients));

  /// Create a copy of IngredientListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientListModelImplCopyWith<_$IngredientListModelImpl> get copyWith =>
      __$$IngredientListModelImplCopyWithImpl<_$IngredientListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientListModelImplToJson(
      this,
    );
  }
}

abstract class _IngredientListModel implements IngredientListModel {
  const factory _IngredientListModel(
          {required final List<IngredientModel> ingredients}) =
      _$IngredientListModelImpl;

  factory _IngredientListModel.fromJson(Map<String, dynamic> json) =
      _$IngredientListModelImpl.fromJson;

  @override
  List<IngredientModel> get ingredients;

  /// Create a copy of IngredientListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientListModelImplCopyWith<_$IngredientListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
