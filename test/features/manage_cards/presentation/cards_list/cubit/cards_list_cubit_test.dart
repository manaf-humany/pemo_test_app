import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';

/// Mock for the [GetCards] use case.
class MockGetCards extends Mock implements GetCards {}

/// Mock for the [CardEntity] entity.
// ignore: avoid_implementing_value_types
class MockCardEntity extends Mock implements CardEntity {}

// ignore: avoid_implementing_value_types
class FakeNoParams extends Fake implements NoParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeNoParams());
  });

  /// Test suite for the [CardsListCubit].
  group('CardsListCubit', () {
    late CardsListCubit cardsListCubit;
    late MockGetCards mockGetCards;

    setUp(() {
      mockGetCards = MockGetCards();
      cardsListCubit = CardsListCubit(getCards: mockGetCards);
    });

    tearDown(() {
      cardsListCubit.close();
    });

    /// Test to ensure the initial state of the cubit is correct.
    test('initial state is correct', () {
      expect(cardsListCubit.state, const CardsListState.initial());
    });

    /// Tests for the [fetchCards] method.
    group('fetchCards', () {
      final tCard = MockCardEntity();
      final tCardsList = [tCard];
      final tFailure = ServerFailure();

      blocTest<CardsListCubit, CardsListState>(
        'emits [loading, loaded] when fetchCards is successful',
        setUp: () {
          when(() => mockGetCards(any()))
              .thenAnswer((_) async => Right(tCardsList));
        },
        build: () => cardsListCubit,
        act: (cubit) => cubit.loadCards(),
        expect: () => [
          const CardsListState.loading(),
          CardsListState.loaded(tCardsList),
        ],
      );

      blocTest<CardsListCubit, CardsListState>(
        'emits [loading, empty] when getCards returns an empty list',
        setUp: () {
          when(() => mockGetCards(any()))
              .thenAnswer((_) async => const Right([]));
        },
        build: () => cardsListCubit,
        act: (cubit) => cubit.loadCards(),
        expect: () => [
          const CardsListState.loading(),
          const CardsListState.empty(),
        ],
      );

      blocTest<CardsListCubit, CardsListState>(
        'emits [loading, error] when fetchCards fails',
        setUp: () {
          when(() => mockGetCards(any()))
              .thenAnswer((_) async => Left(tFailure));
        },
        build: () => cardsListCubit,
        act: (cubit) => cubit.loadCards(),
        expect: () => [
          const CardsListState.loading(),
          CardsListState.error(tFailure.toString()),
        ],
      );
    });
  });
}
