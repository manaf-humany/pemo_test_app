import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(PemoTestStoryBook());
}

final _plugins = initializePlugins(
  initialDeviceFrameData: defaultDeviceFrameData,
);

class PemoTestStoryBook extends StatelessWidget {
  const PemoTestStoryBook({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      builder:
          (context, ___) => Storybook(
        plugins: _plugins,
        wrapperBuilder:
            (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
          home: child,
        ),
        stories: [
          AppEmptyWidgetStory(),
          AppErrorWidgetStory(),
          AppLoaderWidgetStory(),
          AppMainButtonStory(),
        ],
      ),
    );
  }
}
