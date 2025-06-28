// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionsModel _$TransactionsModelFromJson(Map<String, dynamic> json) {
  return _TransactionsModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionsModel {
  @HiveField(0)
  List<TransactionItemModel> get transactions =>
      throw _privateConstructorUsedError;

  /// Serializes this TransactionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionsModelCopyWith<TransactionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsModelCopyWith<$Res> {
  factory $TransactionsModelCopyWith(
          TransactionsModel value, $Res Function(TransactionsModel) then) =
      _$TransactionsModelCopyWithImpl<$Res, TransactionsModel>;
  @useResult
  $Res call({@HiveField(0) List<TransactionItemModel> transactions});
}

/// @nodoc
class _$TransactionsModelCopyWithImpl<$Res, $Val extends TransactionsModel>
    implements $TransactionsModelCopyWith<$Res> {
  _$TransactionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionsModelImplCopyWith<$Res>
    implements $TransactionsModelCopyWith<$Res> {
  factory _$$TransactionsModelImplCopyWith(_$TransactionsModelImpl value,
          $Res Function(_$TransactionsModelImpl) then) =
      __$$TransactionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) List<TransactionItemModel> transactions});
}

/// @nodoc
class __$$TransactionsModelImplCopyWithImpl<$Res>
    extends _$TransactionsModelCopyWithImpl<$Res, _$TransactionsModelImpl>
    implements _$$TransactionsModelImplCopyWith<$Res> {
  __$$TransactionsModelImplCopyWithImpl(_$TransactionsModelImpl _value,
      $Res Function(_$TransactionsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$TransactionsModelImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionsModelImpl implements _TransactionsModel {
  const _$TransactionsModelImpl(
      {@HiveField(0) required final List<TransactionItemModel> transactions})
      : _transactions = transactions;

  factory _$TransactionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionsModelImplFromJson(json);

  final List<TransactionItemModel> _transactions;
  @override
  @HiveField(0)
  List<TransactionItemModel> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'TransactionsModel(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsModelImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  /// Create a copy of TransactionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsModelImplCopyWith<_$TransactionsModelImpl> get copyWith =>
      __$$TransactionsModelImplCopyWithImpl<_$TransactionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionsModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionsModel implements TransactionsModel {
  const factory _TransactionsModel(
          {@HiveField(0)
          required final List<TransactionItemModel> transactions}) =
      _$TransactionsModelImpl;

  factory _TransactionsModel.fromJson(Map<String, dynamic> json) =
      _$TransactionsModelImpl.fromJson;

  @override
  @HiveField(0)
  List<TransactionItemModel> get transactions;

  /// Create a copy of TransactionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsModelImplCopyWith<_$TransactionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
