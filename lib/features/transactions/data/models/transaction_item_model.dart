import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'transaction_item_model.freezed.dart';
part 'transaction_item_model.g.dart';

@freezed
@HiveType(typeId: 0)
class TransactionItemModel with _$TransactionItemModel {
  const factory TransactionItemModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required DateTime date,
    @HiveField(3) required String merchant,
    @HiveField(4) required num billingAmount,
    @HiveField(5) required String image,
    @HiveField(6) required String billingCurrency,
  }) = _TransactionItemModel;

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemModelFromJson(json);
}
