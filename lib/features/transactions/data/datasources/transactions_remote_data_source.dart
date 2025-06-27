import 'package:dio/dio.dart';
import 'package:pemo_test_project/core/error/exceptions.dart';
import 'package:pemo_test_project/features/transactions/data/models/transaction_item_model.dart';

abstract class TransactionsRemoteDataSource {
  /// Calls the transaction endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<TransactionItemModel>> getTransactions();
}

class TransactionsRemoteDataSourceImpl implements TransactionsRemoteDataSource {
  TransactionsRemoteDataSourceImpl({required this.client});
  final Dio client;

  @override
  Future<List<TransactionItemModel>> getTransactions() async {
    try {
      final response = await client.get('/pemo/transaction');
      if (response.statusCode == 200) {
        final transactions =
            (response.data as List)
                .map(
                  (json) => TransactionItemModel.fromJson(
                    json as Map<String, dynamic>,
                  ),
                )
                .toList();
        return transactions;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
