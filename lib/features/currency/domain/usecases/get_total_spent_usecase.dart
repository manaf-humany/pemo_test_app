import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';

/// A use case for calculating the total amount spent from a list of transactions,
/// converted to a single currency (USD).
///
/// This class encapsulates the business logic required to convert different
/// currency amounts into a unified total, promoting separation of concerns and
/// making the logic reusable and testable.
class GetTotalSpent implements UseCase<double, GetTotalSpentParams> {
  /// Creates an instance of [GetTotalSpent].
  ///
  /// Requires a [CurrencyRepository] to be injected.
  GetTotalSpent({required this.currencyRepository});

  /// The repository for fetching currency exchange rates.
  final CurrencyRepository currencyRepository;

  /// Executes the use case.
  ///
  /// Takes a list of [TransactionItemEntity] and returns the total spent amount
  /// converted to USD. It handles fetching exchange rates and performing the
  /// calculation. Returns a [Future] of [Either] a [Failure] or a [double]
  /// representing the total spent.
  ///
  /// If a currency is not found in the exchange rate table, it defaults to a
  /// 1:1 conversion with USD (or the base currency of the rates) and logs a warning.
  @override
  Future<Either<Failure, double>> call(
    GetTotalSpentParams getTotalSpentParams,
  ) async {
    final failureOrRates = await currencyRepository.getExchangeRates();

    return failureOrRates.fold(
      (
        failure,
      ) {
        // In case of failure to get rates, return the failure and log the error.
        log('Failed to get exchange rates: ${failure.toString()}');
        return Left(failure);
      },
      (rates) {
        double total = 0.0;
        for (final transaction in getTotalSpentParams.transactions) {
          // We only sum up positive amounts, representing expenses.
          if (transaction.billingAmount > 0) {
            final rate = rates[transaction.billingCurrency.toUpperCase()];
            if (rate == null) {
              // Handle cases where the currency is not in our exchange table.
              log('Warning: Currency "${transaction.billingCurrency}" not found. Assuming 1:1 rate with USD.');
              total += transaction.billingAmount;
            } else {
              total += transaction.billingAmount * rate;
            }
          }
        }
        return Right(total);
      },
    );
  }
}

class GetTotalSpentParams extends Equatable {
  const GetTotalSpentParams({
    required this.transactions,
  });

  final List<TransactionItemEntity> transactions;

  @override
  List<Object?> get props => [transactions];
}
