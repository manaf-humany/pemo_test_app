import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/currency/currency.dart';

/// The concrete implementation of the [CurrencyRepository].
///
/// This class connects to the [CurrencyRemoteDataSource] to fetch exchange rates.
/// It implements the error handling logic, catching exceptions from the data layer
/// and converting them into a [Failure] object that the domain layer can understand.
class CurrencyRepositoryImpl implements CurrencyRepository {
  /// Creates an instance of [CurrencyRepositoryImpl].
  ///
  /// Requires a [CurrencyRemoteDataSource] to be injected.
  CurrencyRepositoryImpl({required this.remoteDataSource});

  /// The remote data source for fetching currency data.
  final CurrencyRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Map<String, double>>> getExchangeRates() async {
    try {
      final rates = await remoteDataSource.getExchangeRates();
      return Right(rates);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    } catch (e) {
      // For any other unexpected exceptions.
      return Left(ServerFailure());
    }
  }
}
