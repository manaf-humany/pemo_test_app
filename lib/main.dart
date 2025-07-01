import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/features.dart';
import 'package:pemo_test_project/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      builder: (context, theme) {
        return MaterialApp(
          title: 'Pemo Test Project',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
