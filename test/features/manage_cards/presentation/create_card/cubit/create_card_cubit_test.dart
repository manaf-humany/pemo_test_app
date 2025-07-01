import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';
import 'package:uuid/uuid.dart';

/// Mock for the [CreateCard] use case to isolate the cubit during testing.
class MockCreateCard extends Mock implements CreateCard {}

// ignore: avoid_implementing_value_types
class FakeCreateCardParams extends Fake implements CreateCardParams {}

void main() {
  /// Test suite for the [CreateCardCubit].
  group('CreateCardCubit', () {
    late CreateCardCubit createCardCubit;
    late MockCreateCard mockCreateCard;

    setUp(() {
      registerFallbackValue(FakeCreateCardParams());
      mockCreateCard = MockCreateCard();
      createCardCubit =
          CreateCardCubit(createCard: mockCreateCard, uuid: Uuid());
    });

    /// Test to ensure the initial state of the cubit is correct.
    test('initial state is correct', () {
      expect(createCardCubit.state, const CreateCardState());
    });

    /// Tests for the [onCardNameChanged] method.
    group('onCardNameChanged', () {
      blocTest<CreateCardCubit, CreateCardState>(
        'emits state with updated card name and initial status',
        build: () => createCardCubit,
        act: (cubit) => cubit.onCardNameChanged('New Card'),
        expect: () => [
          isA<CreateCardState>()
              .having((s) => s.cardName.value, 'cardName.value', 'New Card')
              .having((s) => s.status, 'status', FormzSubmissionStatus.initial),
        ],
      );
    });

    /// Tests for the [onCardholderChanged] method.
    group('onCardholderChanged', () {
      blocTest<CreateCardCubit, CreateCardState>(
        'emits state with updated cardholder and initial status',
        build: () => createCardCubit,
        act: (cubit) => cubit.onCardholderChanged('John Doe'),
        expect: () => [
          isA<CreateCardState>()
              .having((s) => s.cardholder.value, 'cardholder.value', 'John Doe')
              .having((s) => s.status, 'status', FormzSubmissionStatus.initial),
        ],
      );
    });

    /// Tests for the [onBalanceChanged] method.
    group('onBalanceChanged', () {
      blocTest<CreateCardCubit, CreateCardState>(
        'emits state with updated balance and initial status',
        build: () => createCardCubit,
        act: (cubit) => cubit.onBalanceChanged('500'),
        expect: () => [
          isA<CreateCardState>()
              .having((s) => s.balance.value, 'balance.value', '500')
              .having((s) => s.status, 'status', FormzSubmissionStatus.initial),
        ],
      );
    });

    /// Tests for the [onCardColorChanged] method.
    group('onCardColorChanged', () {
      blocTest<CreateCardCubit, CreateCardState>(
        'emits state with updated card color and initial status',
        build: () => createCardCubit,
        act: (cubit) => cubit.onCardColorChanged(0xFFFFFFFF),
        expect: () => [
          isA<CreateCardState>()
              .having((s) => s.cardColor.value, 'cardColor.value', 0xFFFFFFFF)
              .having((s) => s.status, 'status', FormzSubmissionStatus.initial),
        ],
      );
    });

    /// Tests for the stepper logic.
    group('Stepper Logic', () {
      blocTest<CreateCardCubit, CreateCardState>(
        'onStepContinued increments currentStep when current step is valid',
        build: () => createCardCubit,
        seed: () => const CreateCardState(
          cardName: CardNameInput.dirty('Test Card'),
          cardholder: CardholderInput.dirty('John Doe'),
        ),
        act: (cubit) => cubit.onStepContinue(),
        expect: () => [
          isA<CreateCardState>().having((s) => s.currentStep, 'currentStep', 1),
        ],
      );

      blocTest<CreateCardCubit, CreateCardState>(
        'onStepCancelled decrements currentStep when not on the first step',
        build: () => createCardCubit,
        seed: () => const CreateCardState(currentStep: 1),
        act: (cubit) => cubit.onStepCancel(),
        expect: () => [
          isA<CreateCardState>().having((s) => s.currentStep, 'currentStep', 0),
        ],
      );
    });

    /// Tests for the form submission logic.
    group('submit', () {
      blocTest<CreateCardCubit, CreateCardState>(
        'emits [inProgress, success] when submission is successful',
        setUp: () {
          when(() => mockCreateCard(any()))
              .thenAnswer((_) async => const Right(null));
        },
        build: () => createCardCubit,
        seed: () => CreateCardState(
          cardName: CardNameInput.dirty('Test Card'),
          cardholder: CardholderInput.dirty('John Doe'),
          balance: BalanceInput.dirty('250'),
          cardColor: CardColorInput.dirty(0xFFFFFFFF),
        ),
        act: (cubit) => cubit.onFormSubmitted(),
        expect: () => [
          isA<CreateCardState>().having(
            (s) => s.status,
            'status',
            FormzSubmissionStatus.inProgress,
          ),
          isA<CreateCardState>()
              .having((s) => s.status, 'status', FormzSubmissionStatus.success),
        ],
      );

      blocTest<CreateCardCubit, CreateCardState>(
        'emits [inProgress, failure] when submission fails',
        setUp: () {
          when(() => mockCreateCard(any()))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => createCardCubit,
        seed: () => CreateCardState(
          cardName: CardNameInput.dirty('Test Card'),
          cardholder: CardholderInput.dirty('John Doe'),
          balance: BalanceInput.dirty('250'),
          cardColor: CardColorInput.dirty(0xFFFFFFFF),
        ),
        act: (cubit) => cubit.onFormSubmitted(),
        expect: () => [
          isA<CreateCardState>().having(
            (s) => s.status,
            'status',
            FormzSubmissionStatus.inProgress,
          ),
          isA<CreateCardState>()
              .having((s) => s.status, 'status', FormzSubmissionStatus.failure),
        ],
      );
    });
  });
}
