import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

/// A use case for creating a new card.
class CreateCard implements UseCase<void, Params> {
  CreateCard(this.repository);

  final ManageCardsRepository repository;

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return repository.createCard(params.card);
  }
}

/// The parameters required for the [CreateCard] use case.
class Params extends Equatable {
  const Params({required this.card});

  final CardEntity card;

  @override
  List<Object?> get props => [card];
}
