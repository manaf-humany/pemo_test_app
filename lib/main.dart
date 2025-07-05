import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/features.dart';
import 'package:pemo_test_project/injection_container.dart' as di;

/// The main entry point of the application.
///
/// Initializes Flutter bindings, sets up dependency injection, and runs the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

/// A global key for accessing the root [ScaffoldMessengerState].
///
/// This can be used to display snackbars or other messages from anywhere in the app.
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

/// The root widget of the application.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
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
