import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

/// A use case for retrieving the list of all saved cards.
class GetCards implements UseCase<List<CardEntity>, NoParams> {
  GetCards(this.repository);

  final ManageCardsRepository repository;

  @override
  Future<Either<Failure, List<CardEntity>>> call(NoParams params) async {
    return repository.getCards();
  }
}
