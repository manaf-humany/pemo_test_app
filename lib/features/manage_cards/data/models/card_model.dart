import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

/// A data model representing a payment card.
///
/// This class models a payment card, which can be stored and managed locally
/// using Hive or retrieved from an API (Maybe in future). It is designed to be easily
/// convertible to and from JSON for seamless integration with backend services.
@freezed
@HiveType(typeId: 3, adapterName: 'CardModelAdapter')
class CardModel with _$CardModel {
  /// Private constructor for [CardModel].
  ///
  /// This is part of the `freezed` package's pattern for creating immutable
  /// classes.
  const CardModel._();

  /// The default factory constructor for [CardModel].
  ///
  /// Creates an instance of [CardModel] with the given properties.
  /// All fields are required.
  ///
  /// - [id]: The unique identifier for the card.
  /// - [cardName]: The name of the card.
  /// - [cardholderName]: The name of the cardholder.
  /// - [balance]: The current balance on the card.
  /// - [cardColor]: An integer representing the color of the card.
  const factory CardModel({
    /// The unique identifier for the card.
    @HiveField(0) required String id,

    /// The name of the card.
    @HiveField(1) required String cardName,

    /// The name of the cardholder.
    @HiveField(2) required String cardholderName,

    /// The current balance on the card.
    @HiveField(3) required int balance,

    /// An integer representing the color of the card.
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
