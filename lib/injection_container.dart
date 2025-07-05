import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';
import 'package:uuid/uuid.dart';

/// Service Locator instance
final sl = GetIt.instance;

/// Initializes all dependencies for the application.
Future<void> init() async {
  // Features
  _registerTransactionsFeature();
  _registerCurrencyFeature();
  _registerTransactionDetailsFeature();
  _registerManageCardsFeature();

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  sl.registerLazySingleton(() => DioNetworkService(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => const Uuid());

  await _initHive();
}

/// Registers dependencies for the Transactions feature.
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

/// Registers dependencies for the Manage Cards feature.
void _registerManageCardsFeature() {
  // Cubits
  sl.registerLazySingleton(() => CardsListCubit(getCards: sl()));
  sl.registerFactory(() => CreateCardCubit(createCard: sl(), uuid: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetCards(sl()));
  sl.registerLazySingleton(() => CreateCard(sl()));

  // Repositories
  sl.registerLazySingleton<ManageCardsRepository>(
    () => ManageCardsRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ManageCardsLocalDataSource>(
    () => ManageCardsLocalDataSourceImpl(
      hive: sl(),
    ),
  );
}

/// Registers dependencies for the Currency feature.
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

/// Registers dependencies for the Transaction Details feature.
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

/// Initializes Hive and registers related dependencies.
Future<void> _initHive() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive Adapters (for custom types)
  Hive.registerAdapter(TransactionItemModelAdapter());
  Hive.registerAdapter(TransactionsModelAdapter());
  Hive.registerAdapter(TransactionDetailsModelAdapter());
  Hive.registerAdapter(CardModelAdapter());

  // Open Hive boxes
  final transactionsBox = await Hive.openBox<TransactionsModel>('transactions');
  final transactionDetailsBox =
      await Hive.openBox<TransactionDetailsModel>('transaction_details');
  final cardsBox = await Hive.openBox<CardModel>(kCardsBoxKey);

  // Register Hive boxes with GetIt
  sl.registerLazySingleton<Box<TransactionsModel>>(() => transactionsBox);
  sl.registerLazySingleton<Box<TransactionDetailsModel>>(
    () => transactionDetailsBox,
  );
  sl.registerLazySingleton<Box<CardModel>>(() => cardsBox);
  sl.registerLazySingleton<HiveInterface>(() => Hive);
}
