import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

/// A mock implementation of [TransactionDetailsRepository] for testing.
class MockTransactionDetailsRepository extends Mock
    implements TransactionDetailsRepository {}

/// The main function for running the tests.
void main() {
  /// The use case instance for getting transaction details.
  late GetTransactionDetails usecase;

  /// The mock repository for transaction details.
  late MockTransactionDetailsRepository mockRepository;

  /// Sets up the test environment before each test.
  setUp(() {
    mockRepository = MockTransactionDetailsRepository();
    usecase = GetTransactionDetails(mockRepository);
  });

  /// The transaction ID used for testing.
  const tTransactionId = '1';

  /// The transaction details entity used for testing.
  final tTransactionDetailsEntity = const TransactionDetailsEntity(
    id: '1',
    name: 'Grocery Shopping',
    date: 1625142600,
    merchant: 'SuperMart',
    billingAmount: 45.75,
    image: 'https://example.com/grocery.png',
    billingCurrency: 'USD',
  );

  test(
    'should get transaction details from the repository',
    () async {
      // Arrange
      when(() => mockRepository.getTransactionDetails(any()))
          .thenAnswer((_) async => Right(tTransactionDetailsEntity));

      // Act
      final result =
          await usecase(const GetTransactionDetailsParams(id: tTransactionId));

      // Assert
      expect(result, Right(tTransactionDetailsEntity));
      verify(() => mockRepository.getTransactionDetails(tTransactionId));
      verifyNoMoreInteractions(mockRepository);
    },
  );

  test(
    'should return a Failure when the repository call is unsuccessful',
    () async {
      // Arrange
      when(() => mockRepository.getTransactionDetails(any()))
          .thenAnswer((_) async => Left(ServerFailure()));

      // Act
      final result =
          await usecase(const GetTransactionDetailsParams(id: tTransactionId));

      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => mockRepository.getTransactionDetails(tTransactionId));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
