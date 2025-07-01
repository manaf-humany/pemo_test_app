import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

/// The concrete implementation of [ManageCardsRepository].
///
/// This repository handles card data operations. Since this is a local-only
/// feature, it interacts directly with the [ManageCardsLocalDataSource].
class ManageCardsRepositoryImpl implements ManageCardsRepository {
  ManageCardsRepositoryImpl({required this.localDataSource});

  final ManageCardsLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<CardEntity>>> getCards() async {
    try {
      final cardModels = await localDataSource.getCards();
      final cardEntities = cardModels.map((model) => model.toEntity()).toList();
      return Right(cardEntities);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> createCard(CardEntity card) async {
    try {
      final cardModel = CardModel(
        id: card.id ?? '',
        cardName: card.cardName,
        cardholderName: card.cardholderName,
        balance: card.balance,
        cardColor: card.cardColor,
      );
      await localDataSource.cacheCard(cardModel);
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
