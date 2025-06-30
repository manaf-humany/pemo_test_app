import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pemo_test_project/features/transaction_details/domain/entities/transaction_details.dart';

part 'transaction_details_model.freezed.dart';
part 'transaction_details_model.g.dart';

@freezed
@HiveType(typeId: 2)
class TransactionDetailsModel with _$TransactionDetailsModel {
  const factory TransactionDetailsModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required int date,
    @HiveField(3) required String merchant,
    @HiveField(4) required num billingAmount,
    @HiveField(5) required String image,
    @HiveField(6) required String billingCurrency,
  }) = _TransactionDetailsModel;

  factory TransactionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailsModelFromJson(json);
}

extension TransactionDetailsModelX on TransactionDetailsModel {
  TransactionDetailsEntity toEntity() {
    return TransactionDetailsEntity(
      id: id,
      name: name,
      date: date,
      merchant: merchant,
      billingAmount: billingAmount,
      image: image,
      billingCurrency: billingCurrency,
    );
  }
}
