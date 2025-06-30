import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';

/// An abstract repository that defines the contract for accessing currency data.
///
/// The repository layer isolates the data sources from the domain layer (use cases)
/// and provides a clean API for data access. It is responsible for coordinating
/// data from different sources (e.g., remote API, local cache) and handling errors.
abstract class CurrencyRepository {
  /// Retrieves a map of currency exchange rates against a base currency (USD).
  ///
  /// Returns a [Future] that completes with either a [Failure] on error or
  /// a [Map<String, double>] on success. The map contains currency codes as keys
  /// and their corresponding exchange rates as values.
  Future<Either<Failure, Map<String, double>>> getExchangeRates();
}
