// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return _CardModel.fromJson(json);
}

/// @nodoc
mixin _$CardModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get cardName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get cardholderName => throw _privateConstructorUsedError;
  @HiveField(3)
  int get balance => throw _privateConstructorUsedError;
  @HiveField(4)
  int get cardColor => throw _privateConstructorUsedError;

  /// Serializes this CardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardModelCopyWith<CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardModelCopyWith<$Res> {
  factory $CardModelCopyWith(CardModel value, $Res Function(CardModel) then) =
      _$CardModelCopyWithImpl<$Res, CardModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String cardName,
      @HiveField(2) String cardholderName,
      @HiveField(3) int balance,
      @HiveField(4) int cardColor});
}

/// @nodoc
class _$CardModelCopyWithImpl<$Res, $Val extends CardModel>
    implements $CardModelCopyWith<$Res> {
  _$CardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardName = null,
    Object? cardholderName = null,
    Object? balance = null,
    Object? cardColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cardName: null == cardName
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String,
      cardholderName: null == cardholderName
          ? _value.cardholderName
          : cardholderName // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      cardColor: null == cardColor
          ? _value.cardColor
          : cardColor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardModelImplCopyWith<$Res>
    implements $CardModelCopyWith<$Res> {
  factory _$$CardModelImplCopyWith(
          _$CardModelImpl value, $Res Function(_$CardModelImpl) then) =
      __$$CardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String cardName,
      @HiveField(2) String cardholderName,
      @HiveField(3) int balance,
      @HiveField(4) int cardColor});
}

/// @nodoc
class __$$CardModelImplCopyWithImpl<$Res>
    extends _$CardModelCopyWithImpl<$Res, _$CardModelImpl>
    implements _$$CardModelImplCopyWith<$Res> {
  __$$CardModelImplCopyWithImpl(
      _$CardModelImpl _value, $Res Function(_$CardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardName = null,
    Object? cardholderName = null,
    Object? balance = null,
    Object? cardColor = null,
  }) {
    return _then(_$CardModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cardName: null == cardName
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String,
      cardholderName: null == cardholderName
          ? _value.cardholderName
          : cardholderName // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      cardColor: null == cardColor
          ? _value.cardColor
          : cardColor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardModelImpl extends _CardModel {
  const _$CardModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.cardName,
      @HiveField(2) required this.cardholderName,
      @HiveField(3) required this.balance,
      @HiveField(4) required this.cardColor})
      : super._();

  factory _$CardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String cardName;
  @override
  @HiveField(2)
  final String cardholderName;
  @override
  @HiveField(3)
  final int balance;
  @override
  @HiveField(4)
  final int cardColor;

  @override
  String toString() {
    return 'CardModel(id: $id, cardName: $cardName, cardholderName: $cardholderName, balance: $balance, cardColor: $cardColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cardName, cardName) ||
                other.cardName == cardName) &&
            (identical(other.cardholderName, cardholderName) ||
                other.cardholderName == cardholderName) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.cardColor, cardColor) ||
                other.cardColor == cardColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, cardName, cardholderName, balance, cardColor);

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      __$$CardModelImplCopyWithImpl<_$CardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardModelImplToJson(
      this,
    );
  }
}

abstract class _CardModel extends CardModel {
  const factory _CardModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String cardName,
      @HiveField(2) required final String cardholderName,
      @HiveField(3) required final int balance,
      @HiveField(4) required final int cardColor}) = _$CardModelImpl;
  const _CardModel._() : super._();

  factory _CardModel.fromJson(Map<String, dynamic> json) =
      _$CardModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get cardName;
  @override
  @HiveField(2)
  String get cardholderName;
  @override
  @HiveField(3)
  int get balance;
  @override
  @HiveField(4)
  int get cardColor;

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
