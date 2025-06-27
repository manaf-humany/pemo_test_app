// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionsListModel {

@HiveField(0) List<TransactionItemModel> get transactions;
/// Create a copy of TransactionsListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsListModelCopyWith<TransactionsListModel> get copyWith => _$TransactionsListModelCopyWithImpl<TransactionsListModel>(this as TransactionsListModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsListModel&&const DeepCollectionEquality().equals(other.transactions, transactions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(transactions));

@override
String toString() {
  return 'TransactionsListModel(transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $TransactionsListModelCopyWith<$Res>  {
  factory $TransactionsListModelCopyWith(TransactionsListModel value, $Res Function(TransactionsListModel) _then) = _$TransactionsListModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) List<TransactionItemModel> transactions
});




}
/// @nodoc
class _$TransactionsListModelCopyWithImpl<$Res>
    implements $TransactionsListModelCopyWith<$Res> {
  _$TransactionsListModelCopyWithImpl(this._self, this._then);

  final TransactionsListModel _self;
  final $Res Function(TransactionsListModel) _then;

/// Create a copy of TransactionsListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactions = null,}) {
  return _then(_self.copyWith(
transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionItemModel>,
  ));
}

}


/// @nodoc


class _TransactionsListModel implements TransactionsListModel {
  const _TransactionsListModel({@HiveField(0) required final  List<TransactionItemModel> transactions}): _transactions = transactions;
  

 final  List<TransactionItemModel> _transactions;
@override@HiveField(0) List<TransactionItemModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}


/// Create a copy of TransactionsListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsListModelCopyWith<_TransactionsListModel> get copyWith => __$TransactionsListModelCopyWithImpl<_TransactionsListModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionsListModel&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'TransactionsListModel(transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class _$TransactionsListModelCopyWith<$Res> implements $TransactionsListModelCopyWith<$Res> {
  factory _$TransactionsListModelCopyWith(_TransactionsListModel value, $Res Function(_TransactionsListModel) _then) = __$TransactionsListModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) List<TransactionItemModel> transactions
});




}
/// @nodoc
class __$TransactionsListModelCopyWithImpl<$Res>
    implements _$TransactionsListModelCopyWith<$Res> {
  __$TransactionsListModelCopyWithImpl(this._self, this._then);

  final _TransactionsListModel _self;
  final $Res Function(_TransactionsListModel) _then;

/// Create a copy of TransactionsListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactions = null,}) {
  return _then(_TransactionsListModel(
transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionItemModel>,
  ));
}


}


/// @nodoc
mixin _$TransactionItemModel {

@HiveField(0) String get id;@HiveField(1) String get name;@HiveField(2) int get date;@HiveField(3) String get merchant;@HiveField(4) num get billingAmount;@HiveField(5) String get image;@HiveField(6) String get billingCurrency;@HiveField(7) num? get originalAmount;@HiveField(8) String? get originalCurrency;
/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemModelCopyWith<TransactionItemModel> get copyWith => _$TransactionItemModelCopyWithImpl<TransactionItemModel>(this as TransactionItemModel, _$identity);

  /// Serializes this TransactionItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.date, date) || other.date == date)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.billingAmount, billingAmount) || other.billingAmount == billingAmount)&&(identical(other.image, image) || other.image == image)&&(identical(other.billingCurrency, billingCurrency) || other.billingCurrency == billingCurrency)&&(identical(other.originalAmount, originalAmount) || other.originalAmount == originalAmount)&&(identical(other.originalCurrency, originalCurrency) || other.originalCurrency == originalCurrency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,date,merchant,billingAmount,image,billingCurrency,originalAmount,originalCurrency);

@override
String toString() {
  return 'TransactionItemModel(id: $id, name: $name, date: $date, merchant: $merchant, billingAmount: $billingAmount, image: $image, billingCurrency: $billingCurrency, originalAmount: $originalAmount, originalCurrency: $originalCurrency)';
}


}

/// @nodoc
abstract mixin class $TransactionItemModelCopyWith<$Res>  {
  factory $TransactionItemModelCopyWith(TransactionItemModel value, $Res Function(TransactionItemModel) _then) = _$TransactionItemModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String name,@HiveField(2) int date,@HiveField(3) String merchant,@HiveField(4) num billingAmount,@HiveField(5) String image,@HiveField(6) String billingCurrency,@HiveField(7) num? originalAmount,@HiveField(8) String? originalCurrency
});




}
/// @nodoc
class _$TransactionItemModelCopyWithImpl<$Res>
    implements $TransactionItemModelCopyWith<$Res> {
  _$TransactionItemModelCopyWithImpl(this._self, this._then);

  final TransactionItemModel _self;
  final $Res Function(TransactionItemModel) _then;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? date = null,Object? merchant = null,Object? billingAmount = null,Object? image = null,Object? billingCurrency = null,Object? originalAmount = freezed,Object? originalCurrency = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as int,merchant: null == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String,billingAmount: null == billingAmount ? _self.billingAmount : billingAmount // ignore: cast_nullable_to_non_nullable
as num,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,billingCurrency: null == billingCurrency ? _self.billingCurrency : billingCurrency // ignore: cast_nullable_to_non_nullable
as String,originalAmount: freezed == originalAmount ? _self.originalAmount : originalAmount // ignore: cast_nullable_to_non_nullable
as num?,originalCurrency: freezed == originalCurrency ? _self.originalCurrency : originalCurrency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TransactionItemModel extends TransactionItemModel {
  const _TransactionItemModel({@HiveField(0) required this.id, @HiveField(1) required this.name, @HiveField(2) required this.date, @HiveField(3) required this.merchant, @HiveField(4) required this.billingAmount, @HiveField(5) required this.image, @HiveField(6) required this.billingCurrency, @HiveField(7) this.originalAmount, @HiveField(8) this.originalCurrency}): super._();
  factory _TransactionItemModel.fromJson(Map<String, dynamic> json) => _$TransactionItemModelFromJson(json);

@override@HiveField(0) final  String id;
@override@HiveField(1) final  String name;
@override@HiveField(2) final  int date;
@override@HiveField(3) final  String merchant;
@override@HiveField(4) final  num billingAmount;
@override@HiveField(5) final  String image;
@override@HiveField(6) final  String billingCurrency;
@override@HiveField(7) final  num? originalAmount;
@override@HiveField(8) final  String? originalCurrency;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemModelCopyWith<_TransactionItemModel> get copyWith => __$TransactionItemModelCopyWithImpl<_TransactionItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.date, date) || other.date == date)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.billingAmount, billingAmount) || other.billingAmount == billingAmount)&&(identical(other.image, image) || other.image == image)&&(identical(other.billingCurrency, billingCurrency) || other.billingCurrency == billingCurrency)&&(identical(other.originalAmount, originalAmount) || other.originalAmount == originalAmount)&&(identical(other.originalCurrency, originalCurrency) || other.originalCurrency == originalCurrency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,date,merchant,billingAmount,image,billingCurrency,originalAmount,originalCurrency);

@override
String toString() {
  return 'TransactionItemModel(id: $id, name: $name, date: $date, merchant: $merchant, billingAmount: $billingAmount, image: $image, billingCurrency: $billingCurrency, originalAmount: $originalAmount, originalCurrency: $originalCurrency)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemModelCopyWith<$Res> implements $TransactionItemModelCopyWith<$Res> {
  factory _$TransactionItemModelCopyWith(_TransactionItemModel value, $Res Function(_TransactionItemModel) _then) = __$TransactionItemModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String name,@HiveField(2) int date,@HiveField(3) String merchant,@HiveField(4) num billingAmount,@HiveField(5) String image,@HiveField(6) String billingCurrency,@HiveField(7) num? originalAmount,@HiveField(8) String? originalCurrency
});




}
/// @nodoc
class __$TransactionItemModelCopyWithImpl<$Res>
    implements _$TransactionItemModelCopyWith<$Res> {
  __$TransactionItemModelCopyWithImpl(this._self, this._then);

  final _TransactionItemModel _self;
  final $Res Function(_TransactionItemModel) _then;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? date = null,Object? merchant = null,Object? billingAmount = null,Object? image = null,Object? billingCurrency = null,Object? originalAmount = freezed,Object? originalCurrency = freezed,}) {
  return _then(_TransactionItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as int,merchant: null == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String,billingAmount: null == billingAmount ? _self.billingAmount : billingAmount // ignore: cast_nullable_to_non_nullable
as num,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,billingCurrency: null == billingCurrency ? _self.billingCurrency : billingCurrency // ignore: cast_nullable_to_non_nullable
as String,originalAmount: freezed == originalAmount ? _self.originalAmount : originalAmount // ignore: cast_nullable_to_non_nullable
as num?,originalCurrency: freezed == originalCurrency ? _self.originalCurrency : originalCurrency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
