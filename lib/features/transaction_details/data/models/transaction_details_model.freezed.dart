// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionDetailsModel _$TransactionDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionDetailsModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(3)
  String get merchant => throw _privateConstructorUsedError;
  @HiveField(4)
  num get billingAmount => throw _privateConstructorUsedError;
  @HiveField(5)
  String get image => throw _privateConstructorUsedError;
  @HiveField(6)
  String get billingCurrency => throw _privateConstructorUsedError;

  /// Serializes this TransactionDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionDetailsModelCopyWith<TransactionDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailsModelCopyWith<$Res> {
  factory $TransactionDetailsModelCopyWith(TransactionDetailsModel value,
          $Res Function(TransactionDetailsModel) then) =
      _$TransactionDetailsModelCopyWithImpl<$Res, TransactionDetailsModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) DateTime date,
      @HiveField(3) String merchant,
      @HiveField(4) num billingAmount,
      @HiveField(5) String image,
      @HiveField(6) String billingCurrency});
}

/// @nodoc
class _$TransactionDetailsModelCopyWithImpl<$Res,
        $Val extends TransactionDetailsModel>
    implements $TransactionDetailsModelCopyWith<$Res> {
  _$TransactionDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? merchant = null,
    Object? billingAmount = null,
    Object? image = null,
    Object? billingCurrency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      billingAmount: null == billingAmount
          ? _value.billingAmount
          : billingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      billingCurrency: null == billingCurrency
          ? _value.billingCurrency
          : billingCurrency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionDetailsModelImplCopyWith<$Res>
    implements $TransactionDetailsModelCopyWith<$Res> {
  factory _$$TransactionDetailsModelImplCopyWith(
          _$TransactionDetailsModelImpl value,
          $Res Function(_$TransactionDetailsModelImpl) then) =
      __$$TransactionDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) DateTime date,
      @HiveField(3) String merchant,
      @HiveField(4) num billingAmount,
      @HiveField(5) String image,
      @HiveField(6) String billingCurrency});
}

/// @nodoc
class __$$TransactionDetailsModelImplCopyWithImpl<$Res>
    extends _$TransactionDetailsModelCopyWithImpl<$Res,
        _$TransactionDetailsModelImpl>
    implements _$$TransactionDetailsModelImplCopyWith<$Res> {
  __$$TransactionDetailsModelImplCopyWithImpl(
      _$TransactionDetailsModelImpl _value,
      $Res Function(_$TransactionDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? merchant = null,
    Object? billingAmount = null,
    Object? image = null,
    Object? billingCurrency = null,
  }) {
    return _then(_$TransactionDetailsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      billingAmount: null == billingAmount
          ? _value.billingAmount
          : billingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      billingCurrency: null == billingCurrency
          ? _value.billingCurrency
          : billingCurrency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionDetailsModelImpl implements _TransactionDetailsModel {
  const _$TransactionDetailsModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.date,
      @HiveField(3) required this.merchant,
      @HiveField(4) required this.billingAmount,
      @HiveField(5) required this.image,
      @HiveField(6) required this.billingCurrency});

  factory _$TransactionDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionDetailsModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final DateTime date;
  @override
  @HiveField(3)
  final String merchant;
  @override
  @HiveField(4)
  final num billingAmount;
  @override
  @HiveField(5)
  final String image;
  @override
  @HiveField(6)
  final String billingCurrency;

  @override
  String toString() {
    return 'TransactionDetailsModel(id: $id, name: $name, date: $date, merchant: $merchant, billingAmount: $billingAmount, image: $image, billingCurrency: $billingCurrency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDetailsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.billingAmount, billingAmount) ||
                other.billingAmount == billingAmount) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.billingCurrency, billingCurrency) ||
                other.billingCurrency == billingCurrency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, date, merchant,
      billingAmount, image, billingCurrency);

  /// Create a copy of TransactionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionDetailsModelImplCopyWith<_$TransactionDetailsModelImpl>
      get copyWith => __$$TransactionDetailsModelImplCopyWithImpl<
          _$TransactionDetailsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionDetailsModel implements TransactionDetailsModel {
  const factory _TransactionDetailsModel(
          {@HiveField(0) required final String id,
          @HiveField(1) required final String name,
          @HiveField(2) required final DateTime date,
          @HiveField(3) required final String merchant,
          @HiveField(4) required final num billingAmount,
          @HiveField(5) required final String image,
          @HiveField(6) required final String billingCurrency}) =
      _$TransactionDetailsModelImpl;

  factory _TransactionDetailsModel.fromJson(Map<String, dynamic> json) =
      _$TransactionDetailsModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  DateTime get date;
  @override
  @HiveField(3)
  String get merchant;
  @override
  @HiveField(4)
  num get billingAmount;
  @override
  @HiveField(5)
  String get image;
  @override
  @HiveField(6)
  String get billingCurrency;

  /// Create a copy of TransactionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionDetailsModelImplCopyWith<_$TransactionDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
