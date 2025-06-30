import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A story to showcase the [AppColorPicker] widget.
class AppColorPickerStory extends Story {
  AppColorPickerStory()
      : super(
          name: 'Widgets/AppColorPicker',
          builder: (context) {
            final color = Colors.blue;

            return _AppColorPickerStoryWidget(initialColor: color);
          },
        );
}

class _AppColorPickerStoryWidget extends StatefulWidget {
  const _AppColorPickerStoryWidget({
    required this.initialColor,
  });

  final Color initialColor;

  @override
  State<_AppColorPickerStoryWidget> createState() =>
      _AppColorPickerStoryWidgetState();
}

class _AppColorPickerStoryWidgetState
    extends State<_AppColorPickerStoryWidget> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.initialColor;
  }

  @override
  void didUpdateWidget(covariant _AppColorPickerStoryWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != oldWidget.initialColor) {
      setState(() {
        _currentColor = widget.initialColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppText.bodyLarge('Selected Color:'),
            const SizedBox(height: AppSpacing.x4),
            AppColorPicker(
              pickerColor: _currentColor,
              onColorChanged: (newColor) {
                setState(() {
                  _currentColor = newColor;
                });
              },
            ),
            const SizedBox(height: AppSpacing.x8),
            Container(
              width: 100,
              height: 100,
              color: _currentColor,
            ),
          ],
        ),
      ),
    );
  }
}
