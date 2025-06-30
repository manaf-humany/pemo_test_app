import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pemo_test_project/core/network/network_info.dart';
import 'package:pemo_test_project/core/network/network_service.dart';
import 'package:pemo_test_project/features/currency/currency.dart';
import 'package:pemo_test_project/features/transaction_details/data/datasources/transaction_details_local_data_source.dart';
import 'package:pemo_test_project/features/transaction_details/data/datasources/transaction_details_remote_data_source.dart';
import 'package:pemo_test_project/features/transaction_details/data/models/transaction_details_model.dart';
import 'package:pemo_test_project/features/transaction_details/data/repositories/transaction_details_repository_impl.dart';
import 'package:pemo_test_project/features/transaction_details/domain/repositories/transaction_details_repository.dart';
import 'package:pemo_test_project/features/transaction_details/domain/usecases/get_transaction_details.dart';
import 'package:pemo_test_project/features/transaction_details/presentation/cubit/transaction_details_cubit.dart';
import 'package:pemo_test_project/features/transactions/data/datasources/transactions_local_data_source.dart';
import 'package:pemo_test_project/features/transactions/data/datasources/transactions_remote_data_source.dart';
import 'package:pemo_test_project/features/transactions/data/models/transaction_item_model.dart';
import 'package:pemo_test_project/features/transactions/data/models/transactions_model.dart';
import 'package:pemo_test_project/features/transactions/data/repositories/transactions_repository_impl.dart';
import 'package:pemo_test_project/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:pemo_test_project/features/transactions/domain/usecases/get_transactions.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features
  _registerTransactionsFeature();
  _registerCurrencyFeature();
  _registerTransactionDetailsFeature();

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  sl.registerLazySingleton(() => DioNetworkService(sl()));
  sl.registerLazySingleton(() => Dio());

  await _initHive();
}

void _registerTransactionsFeature() {
  // BLoC
  sl.registerFactory(() => TransactionCubit(getTransactions: sl()));
  sl.registerLazySingleton(() => GetTransactions(sl()));
  sl.registerLazySingleton<TransactionsRepository>(
    () => TransactionsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<TransactionsRemoteDataSource>(
    () => TransactionsRemoteDataSourceImpl(client: sl<DioNetworkService>().dio),
  );
  sl.registerLazySingleton<TransactionsLocalDataSource>(
    () => TransactionsLocalDataSourceImpl(box: sl()),
  );
}

void _registerCurrencyFeature() {
  // BLoC
  sl.registerFactory(() => CurrencyCubit(getTotalSpent: sl()));

  // Use cases
  sl.registerLazySingleton(
    () => GetTotalSpent(currencyRepository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<CurrencyRepository>(
    () => CurrencyRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<CurrencyRemoteDataSource>(
    () => CurrencyRemoteDataSourceImpl(),
  );
}

void _registerTransactionDetailsFeature() {
  // BLoC
  sl.registerFactory(
    () => TransactionDetailsCubit(getTransactionDetails: sl()),
  );
  sl.registerLazySingleton(() => GetTransactionDetails(sl()));
  sl.registerLazySingleton<TransactionDetailsRepository>(
    () => TransactionDetailsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<TransactionDetailsRemoteDataSource>(
    () => TransactionDetailsRemoteDataSourceImpl(
      client: sl<DioNetworkService>().dio,
    ),
  );
  sl.registerLazySingleton<TransactionDetailsLocalDataSource>(
    () => TransactionDetailsLocalDataSourceImpl(box: sl()),
  );
}

Future<void> _initHive() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive Adapters (for custom types)
  Hive.registerAdapter(TransactionItemModelAdapter());
  Hive.registerAdapter(TransactionsModelAdapter());
  Hive.registerAdapter(TransactionDetailsModelAdapter());

  // Open Hive boxes
  final transactionsBox = await Hive.openBox<TransactionsModel>('transactions');
  final transactionDetailsBox =
      await Hive.openBox<TransactionDetailsModel>('transaction_details');

  // Register Hive boxes with GetIt
  sl.registerLazySingleton<Box<TransactionsModel>>(() => transactionsBox);
  sl.registerLazySingleton<Box<TransactionDetailsModel>>(
    () => transactionDetailsBox,
  );
}
