import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';

/// An abstract repository for managing cards.
///
/// This interface defines the contract for data operations related to cards,
/// abstracting the data source from the domain layer.
abstract class ManageCardsRepository {
  /// Creates a new card and saves it to the data source.
  ///
  /// Takes a [CardEntity] to be created.
  /// Returns a [Future] that completes with an [Either] type.
  /// On success, it returns [void].
  /// On failure, it returns a [Failure].
  Future<Either<Failure, void>> createCard(CardEntity card);

  /// Retrieves a list of all saved cards.
  ///
  /// Returns a [Future] that completes with an [Either] type.
  /// On success, it returns a list of [CardEntity]s.
  /// On failure, it returns a [Failure].
  Future<Either<Failure, List<CardEntity>>> getCards();
}
