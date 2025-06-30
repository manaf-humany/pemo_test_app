import 'package:hive/hive.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

abstract class TransactionDetailsLocalDataSource {
  Future<TransactionDetailsModel> getTransactionDetails(String transactionId);
  Future<void> cacheTransactionDetails(TransactionDetailsModel transaction);
}

const String kTransactionDetailsBox = 'transaction_details_box';

class TransactionDetailsLocalDataSourceImpl
    implements TransactionDetailsLocalDataSource {
  TransactionDetailsLocalDataSourceImpl({required this.box});
  final Box<TransactionDetailsModel> box;

  @override
  Future<TransactionDetailsModel> getTransactionDetails(String transactionId) {
    final transaction = box.get(transactionId);
    if (transaction != null) {
      return Future.value(transaction);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheTransactionDetails(TransactionDetailsModel transaction) {
    return box.put(transaction.id, transaction);
  }
}
