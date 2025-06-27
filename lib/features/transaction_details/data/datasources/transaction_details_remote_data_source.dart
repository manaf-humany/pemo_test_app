import 'package:dio/dio.dart';
import 'package:pemo_test_project/core/error/exceptions.dart';
import 'package:pemo_test_project/features/transaction_details/data/models/transaction_details_model.dart';

abstract class TransactionDetailsRemoteDataSource {
  /// Calls the transaction/[id] endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<TransactionDetailsModel> getTransactionDetails(String transactionId);
}

class TransactionDetailsRemoteDataSourceImpl
    implements TransactionDetailsRemoteDataSource {
  TransactionDetailsRemoteDataSourceImpl({required this.client});
  final Dio client;

  @override
  Future<TransactionDetailsModel> getTransactionDetails(
    String transactionId,
  ) async {
    try {
      final response = await client.get('transaction/$transactionId');
      return TransactionDetailsModel.fromJson(response.data);
    } on DioException {
      throw ServerException();
    }
  }
}
