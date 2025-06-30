// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateCardState {
  CardNameInput get cardName => throw _privateConstructorUsedError;
  CardholderInput get cardholder => throw _privateConstructorUsedError;
  BalanceInput get balance => throw _privateConstructorUsedError;
  CardColorInput get cardColor => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  int get currentStep => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CreateCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateCardStateCopyWith<CreateCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCardStateCopyWith<$Res> {
  factory $CreateCardStateCopyWith(
          CreateCardState value, $Res Function(CreateCardState) then) =
      _$CreateCardStateCopyWithImpl<$Res, CreateCardState>;
  @useResult
  $Res call(
      {CardNameInput cardName,
      CardholderInput cardholder,
      BalanceInput balance,
      CardColorInput cardColor,
      FormzSubmissionStatus status,
      int currentStep,
      String? errorMessage});
}

/// @nodoc
class _$CreateCardStateCopyWithImpl<$Res, $Val extends CreateCardState>
    implements $CreateCardStateCopyWith<$Res> {
  _$CreateCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateCardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardName = null,
    Object? cardholder = null,
    Object? balance = null,
    Object? cardColor = null,
    Object? status = null,
    Object? currentStep = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      cardName: null == cardName
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as CardNameInput,
      cardholder: null == cardholder
          ? _value.cardholder
          : cardholder // ignore: cast_nullable_to_non_nullable
              as CardholderInput,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BalanceInput,
      cardColor: null == cardColor
          ? _value.cardColor
          : cardColor // ignore: cast_nullable_to_non_nullable
              as CardColorInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateCardStateImplCopyWith<$Res>
    implements $CreateCardStateCopyWith<$Res> {
  factory _$$CreateCardStateImplCopyWith(_$CreateCardStateImpl value,
          $Res Function(_$CreateCardStateImpl) then) =
      __$$CreateCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CardNameInput cardName,
      CardholderInput cardholder,
      BalanceInput balance,
      CardColorInput cardColor,
      FormzSubmissionStatus status,
      int currentStep,
      String? errorMessage});
}

/// @nodoc
class __$$CreateCardStateImplCopyWithImpl<$Res>
    extends _$CreateCardStateCopyWithImpl<$Res, _$CreateCardStateImpl>
    implements _$$CreateCardStateImplCopyWith<$Res> {
  __$$CreateCardStateImplCopyWithImpl(
      _$CreateCardStateImpl _value, $Res Function(_$CreateCardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateCardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardName = null,
    Object? cardholder = null,
    Object? balance = null,
    Object? cardColor = null,
    Object? status = null,
    Object? currentStep = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CreateCardStateImpl(
      cardName: null == cardName
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as CardNameInput,
      cardholder: null == cardholder
          ? _value.cardholder
          : cardholder // ignore: cast_nullable_to_non_nullable
              as CardholderInput,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BalanceInput,
      cardColor: null == cardColor
          ? _value.cardColor
          : cardColor // ignore: cast_nullable_to_non_nullable
              as CardColorInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateCardStateImpl implements _CreateCardState {
  const _$CreateCardStateImpl(
      {this.cardName = const CardNameInput.pure(),
      this.cardholder = const CardholderInput.pure(),
      this.balance = const BalanceInput.pure(),
      this.cardColor = const CardColorInput.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.currentStep = 0,
      this.errorMessage});

  @override
  @JsonKey()
  final CardNameInput cardName;
  @override
  @JsonKey()
  final CardholderInput cardholder;
  @override
  @JsonKey()
  final BalanceInput balance;
  @override
  @JsonKey()
  final CardColorInput cardColor;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final int currentStep;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CreateCardState(cardName: $cardName, cardholder: $cardholder, balance: $balance, cardColor: $cardColor, status: $status, currentStep: $currentStep, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCardStateImpl &&
            (identical(other.cardName, cardName) ||
                other.cardName == cardName) &&
            (identical(other.cardholder, cardholder) ||
                other.cardholder == cardholder) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.cardColor, cardColor) ||
                other.cardColor == cardColor) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardName, cardholder, balance,
      cardColor, status, currentStep, errorMessage);

  /// Create a copy of CreateCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCardStateImplCopyWith<_$CreateCardStateImpl> get copyWith =>
      __$$CreateCardStateImplCopyWithImpl<_$CreateCardStateImpl>(
          this, _$identity);
}

abstract class _CreateCardState implements CreateCardState {
  const factory _CreateCardState(
      {final CardNameInput cardName,
      final CardholderInput cardholder,
      final BalanceInput balance,
      final CardColorInput cardColor,
      final FormzSubmissionStatus status,
      final int currentStep,
      final String? errorMessage}) = _$CreateCardStateImpl;

  @override
  CardNameInput get cardName;
  @override
  CardholderInput get cardholder;
  @override
  BalanceInput get balance;
  @override
  CardColorInput get cardColor;
  @override
  FormzSubmissionStatus get status;
  @override
  int get currentStep;
  @override
  String? get errorMessage;

  /// Create a copy of CreateCardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCardStateImplCopyWith<_$CreateCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
