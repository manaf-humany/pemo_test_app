import 'package:equatable/equatable.dart';

/// Represents a single payment card in the system.
///
/// This class encapsulates all the essential information about a card,
/// such as its identifier, user-defined name, cardholder's name,
/// current balance, and associated color.

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

  /// Provides a list of properties that are used by `Equatable`
  /// to determine if two instances of `CardEntity` are the same.
  /// If all properties in this list are equal, the instances are considered equal.
  @override
  List<Object?> get props => [
        id,
        cardName,
        cardholderName,
        balance,
        cardColor,
      ];
}
