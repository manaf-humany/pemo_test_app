import 'dart:async';

import 'package:hive/hive.dart';
import 'package:pemo_test_project/core/error/exceptions.dart';
import 'package:pemo_test_project/features/transactions/data/models/transaction_item_model.dart';
import 'package:pemo_test_project/features/transactions/data/models/transactions_model.dart';

abstract class TransactionsLocalDataSource {
  /// Caches a list of [TransactionItemModel] to local storage.
  ///
  /// Throws a [CacheException] if unable to cache the data.
  Future<void> cacheTransactions(TransactionsModel transactions);

  /// Retrieves the cached [TransactionsModel] from local storage.
  ///
  /// Returns the cached [TransactionsModel] if available.
  /// Throws [EmptyCacheException] if no transactions are cached.
  /// Throws a [CacheException] for other cache-related errors.
  Future<TransactionsModel> getTransactions();
}

const String kTransactionsBox = 'transactions_box';
const String kCachedTransactionsKey =
    'CACHED_TRANSACTIONS'; // More specific key for the data itself

class TransactionsLocalDataSourceImpl implements TransactionsLocalDataSource {
  // The box should store TransactionsModel

  TransactionsLocalDataSourceImpl({required this.box});
  final Box<TransactionsModel> box;

  @override
  Future<void> cacheTransactions(TransactionsModel transactionsToCache) {
    try {
      return box.put(kCachedTransactionsKey, transactionsToCache);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<TransactionsModel> getTransactions() async {
    try {
      final transactionsContainer = box.get(kCachedTransactionsKey);

      if (transactionsContainer != null) {
        // We expect TransactionsModel to be stored directly.
        // Hive handles the deserialization if TypeAdapters are registered correctly.
        return Future.value(transactionsContainer);
      } else {
        throw CacheException(); // No data found for the key
      }
    } catch (e) {
      if (e is CacheException) {
        rethrow; // Re-throw the specific exception
      }
      throw CacheException();
    }
  }
}
