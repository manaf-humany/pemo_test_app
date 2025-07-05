import 'dart:async';

import 'package:hive/hive.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

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

/// The name of the Hive box used to store transactions.
const String kTransactionsBox = 'transactions_box';

/// The key used to store the cached transactions within the Hive box.
const String kCachedTransactionsKey =
    'CACHED_TRANSACTIONS'; // More specific key for the data itself

/// Implementation of [TransactionsLocalDataSource] using Hive for local storage.
class TransactionsLocalDataSourceImpl implements TransactionsLocalDataSource {
  // The box should store TransactionsModel

  /// Creates an instance of [TransactionsLocalDataSourceImpl].
  ///
  /// Requires a [Box<TransactionsModel>] to interact with Hive.
  TransactionsLocalDataSourceImpl({required this.box});

  /// The Hive box used for storing and retrieving transactions.
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
        //todo: either create a specific exception in case of empty cache, or return empty list
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
