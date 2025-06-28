import 'package:dio/dio.dart';
import 'package:pemo_test_project/core/error/exceptions.dart';
import 'package:pemo_test_project/features/transactions/data/models/transactions_model.dart';

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
      final response = await client.get('/pemo/transaction');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
