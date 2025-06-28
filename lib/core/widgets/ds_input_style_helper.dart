import 'package:flutter/material.dart';
import 'package:pemo_test_project/core/theme/theme_export.dart';

enum DSInputState { defaultState, disabledState, dangerState }

class DSInputStatesHelper {
  DSInputStatesHelper(this.context, this.state);

  final BuildContext context;
  final DSInputState state;

  final borderRadius = BorderRadius.circular(AppRadius.x3);

  OutlineInputBorder get focusBorder => OutlineInputBorder(
    borderSide: BorderSide(color: AppTheme.of(context).color.bgBrand),
    borderRadius: borderRadius,
  );

  OutlineInputBorder get defaultBorder => OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(color: Colors.transparent),
  );
}
