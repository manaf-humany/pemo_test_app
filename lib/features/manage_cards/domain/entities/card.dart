import 'package:equatable/equatable.dart';

/// Represents a single card in the system.
class CardEntity extends Equatable {
  const CardEntity({
    required this.id,
    required this.cardName,
    required this.cardholderName,
    required this.balance,
    required this.cardColor,
  });

  /// A unique identifier for the card (e.g., a UUID).
  final String id;

  /// The custom name given to the card by the user.
  final String cardName;

  /// The name of the user who holds the card.
  final String cardholderName;

  /// The current balance of the card in the smallest currency unit (e.g., cents).
  final int balance;

  /// The integer representation of the card's color (e.g., 0xFF42A5F5).
  final int cardColor;

  @override
  List<Object?> get props => [
        id,
        cardName,
        cardholderName,
        balance,
        cardColor,
      ];
}
