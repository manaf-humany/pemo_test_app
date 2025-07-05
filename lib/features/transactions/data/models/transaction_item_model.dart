import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

part 'transaction_item_model.freezed.dart';
part 'transaction_item_model.g.dart';

/// Represents an individual transaction item.
///
/// This model is used for data transfer and storage, particularly with Hive.
@freezed
@HiveType(typeId: 0)
class TransactionItemModel with _$TransactionItemModel {
  const factory TransactionItemModel({
    /// The unique identifier for the transaction.
    @HiveField(0) required String id,

    /// The name associated with the transaction.
    @HiveField(1) required String name,

    /// The date of the transaction, typically represented as a Unix timestamp.
    @HiveField(2) required int date,

    /// The merchant involved in the transaction.
    @HiveField(3) required String merchant,

    /// The amount billed for the transaction.
    @HiveField(4) required num billingAmount,

    /// A URL or path to an image associated with the transaction.
    @HiveField(5) required String image,

    /// The currency used for billing.
    @HiveField(6) required String billingCurrency,
  }) = _TransactionItemModel;

  /// Creates a [TransactionItemModel] instance from a JSON map.
  ///
  /// This is typically used when deserializing data from an API or other
  /// JSON source.
  factory TransactionItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemModelFromJson(json);
}

/// Extension methods for the [TransactionItemModel].
extension TransactionItemModelX on TransactionItemModel {
  /// Converts this [TransactionItemModel] to a [TransactionItemEntity].
  TransactionItemEntity toEntity() {
    return TransactionItemEntity(
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
