import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
@HiveType(typeId: 2, adapterName: 'CardModelAdapter')
class CardModel with _$CardModel {
  const CardModel._();

  const factory CardModel({
    @HiveField(0) required String id,
    @HiveField(1) required String cardName,
    @HiveField(2) required String cardholderName,
    @HiveField(3) required int balance,
    @HiveField(4) required int cardColor,
  }) = _CardModel;

  /// A factory constructor that creates a [CardModel] from a JSON object.
  ///
  /// Although this feature is local-only, this is included for completeness
  /// and future-proofing.
  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  /// Converts this [CardModel] to a [CardEntity].
  CardEntity toEntity() {
    return CardEntity(
      id: id,
      cardName: cardName,
      cardholderName: cardholderName,
      balance: balance,
      cardColor: cardColor,
    );
  }
}
