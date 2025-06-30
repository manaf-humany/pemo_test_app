import 'package:dio/dio.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

abstract class TransactionsRemoteDataSource {
  /// Calls the transaction endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<TransactionsModel> getTransactions();
}

class TransactionsRemoteDataSourceImpl implements TransactionsRemoteDataSource {
  TransactionsRemoteDataSourceImpl({required this.client});
  final Dio client;

  @override
  Future<TransactionsModel> getTransactions() async {
    try {
      final response = await client.get('/transaction');
      if (response.statusCode == 200) {
        // The API returns a list of transactions, which we need to wrap
        // in our TransactionsModel.
        return TransactionsModel.fromJson(
          {'transactions': response.data},
        );
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
