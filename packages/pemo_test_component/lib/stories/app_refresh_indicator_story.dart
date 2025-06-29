import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A story for the [AppRefreshIndicator].
///
/// This story demonstrates the pull-to-refresh functionality on a simple list.
class AppRefreshIndicatorStory extends Story {
  /// Creates a story for the [AppRefreshIndicator].
  AppRefreshIndicatorStory()
      : super(
          name: 'Widgets/AppRefreshIndicator',
          builder: (context) => const _RefreshIndicatorDemo(),
        );
}

/// A stateful widget to demonstrate the [AppRefreshIndicator].
class _RefreshIndicatorDemo extends StatefulWidget {
  const _RefreshIndicatorDemo({Key? key}) : super(key: key);

  @override
  _RefreshIndicatorDemoState createState() => _RefreshIndicatorDemoState();
}

class _RefreshIndicatorDemoState extends State<_RefreshIndicatorDemo> {
  late List<String> _items;

  @override
  void initState() {
    super.initState();
    _items = List.generate(20, (i) => 'Item ${i + 1}');
  }

  Future<void> _handleRefresh() async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Add new items to the list
    setState(() {
      final newItems = List.generate(5, (i) => 'New Item ${i + 1}');
      _items.insertAll(0, newItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppRefreshIndicator(
      onRefresh: _handleRefresh,
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: AppText.body1(_items[index]),
          );
        },
      ),
    );
  }
}
