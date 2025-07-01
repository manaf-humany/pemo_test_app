import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

/// A use case for creating a new card.
class CreateCard extends UseCase<void, CreateCardParams> {
  CreateCard(this.repository);

  final ManageCardsRepository repository;

  @override
  Future<Either<Failure, void>> call(CreateCardParams params) async {
    return await repository.createCard(params.card);
  }
}

/// The parameters required for the [CreateCard] use case.
class CreateCardParams extends Equatable {
  const CreateCardParams({required this.card});

  final CardEntity card;

  @override
  List<Object> get props => [card];
}
