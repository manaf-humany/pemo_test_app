import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A widget that allows users to pick a color.
///
/// It displays a circular swatch of the currently selected color.
/// When tapped, it opens a dialog with a color picker.
class AppColorPicker extends StatefulWidget {
  /// Creates an [AppColorPicker].
  const AppColorPicker({
    super.key,
    required this.pickerColor,
    required this.onColorChanged,
    this.colorSwatch, // Add this line
  });

  /// The currently selected color.
  final Color pickerColor;

  /// A callback that is invoked when the color is changed.
  final ValueChanged<Color> onColorChanged;

  /// A map of colors to be displayed as a swatch in the picker.
  final Map<Color, String>? colorSwatch; // Add this line

  @override
  State<AppColorPicker> createState() => _AppColorPickerState();
}

class _AppColorPickerState extends State<AppColorPicker> {
  void _showColorPickerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const AppText.headingMedium('Pick a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: widget.pickerColor,
            onColorChanged: widget.onColorChanged,
            colorPickerWidth: 200,
            pickerAreaHeightPercent: 0.7,
            enableAlpha: false,
            displayThumbColor: true,
            paletteType: PaletteType.hsv,
            labelTypes: const [],
            pickerAreaBorderRadius:
                const BorderRadius.all(Radius.circular(AppSpacing.x2)),
            hexInputBar: true,
            colorHistory: const [],
          ),
        ),
        actions: <Widget>[
          AppMainButton(
            title: 'Got it',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showColorPickerDialog,
      child: Container(
        width: AppSpacing.x12,
        height: AppSpacing.x12,
        decoration: BoxDecoration(
          color: widget.pickerColor,
          shape: BoxShape.circle,
          border: Border.all(
              color: AppTheme.of(context).color.borderColor, width: 2),
        ),
      ),
    );
  }
}
