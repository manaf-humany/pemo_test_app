import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pemo_test_project/features/transactions/presentation/pages/transactions_page.dart';
import 'package:pemo_test_project/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Hive.registerAdapter(TransactionItemModelAdapter());
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemo Transactions',
      home: EasyLocalization(
        supportedLocales: const [Locale('en', 'US')],
        path: 'assets/translations',
        startLocale: const Locale('en', 'US'),
        useFallbackTranslations: true,
        child: const TransactionsPage(),
      ),
    );
  }
}
