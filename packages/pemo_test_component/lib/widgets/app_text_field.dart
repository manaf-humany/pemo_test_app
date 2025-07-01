import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A highly customizable text input field that adapts its appearance based on its state.
///
/// This widget wraps a [TextFormField] and provides extensive customization options
/// for appearance, behavior, and validation.
class AppTextField extends StatefulWidget {
  /// Creates a customizable text field.
  const AppTextField({
    this.state = InputState.defaultState,
    this.hint = '',
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.isEnabled = true,
    this.maxLength,
    this.minLines,
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.maxLines = 1,
    this.onValueChange,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.inputFormatters,
    this.textStyle,
    this.hintStyle,
    this.counterStyle,
    this.scrollPadding,
    this.validator,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.x3,
      vertical: AppSpacing.x3,
    ),
    this.autoFocus = false,
    this.initialValue,
    this.helperMaxLines,
    this.scrollController,
    this.hintTextDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.counter,
    this.expands = false,
    this.textAlignVertical = TextAlignVertical.center,
    this.hintMaxLines = 1,
    this.helperText,
    this.labelText,
    this.isInline = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    super.key,
  });

  /// The controller for the text field.
  final TextEditingController? controller;

  /// The scroll controller for the text field.
  final ScrollController? scrollController;

  /// The initial value to display in the text field.
  final String? initialValue;

  /// The current state of the input field, which determines its appearance.
  final InputState state;

  /// The hint text to display when the field is empty.
  final String hint;

  /// The focus node for the text field.
  final FocusNode? focusNode;

  /// Whether to obscure the text being entered.
  final bool obscureText;

  /// The type of keyboard to display.
  final TextInputType textInputType;

  /// The action to take when the user presses the action button on the keyboard.
  final TextInputAction? textInputAction;

  /// The maximum number of characters allowed in the text field.
  final int? maxLength;

  /// The maximum number of lines to display.
  final int? maxLines;

  /// The minimum number of lines to display.
  final int? minLines;

  /// A callback invoked when the text in the field changes.
  final void Function(String value)? onValueChange;

  /// A callback invoked when the user finishes editing the text.
  final void Function()? onEditingComplete;

  /// A callback invoked when the user submits the field.
  final void Function()? onFieldSubmitted;

  /// A callback invoked when a tap is detected outside of the text field.
  final TapRegionCallback? onTapOutside;

  /// A list of input formatters to apply to the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the text field is enabled.
  final bool isEnabled;

  /// Whether to enable suggestions.
  final bool enableSuggestions;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// The text style for the input.
  final TextStyle? textStyle;

  /// The text style for the hint text.
  final TextStyle? hintStyle;

  /// The text style for the character counter.
  final TextStyle? counterStyle;

  /// The padding for the scrollable content.
  final EdgeInsets contentPadding;

  /// The padding for the scroll view.
  final EdgeInsets? scrollPadding;

  /// An optional icon to display at the end of the text field.
  final Widget? suffixIcon;

  /// Whether the text field should autofocus.
  final bool autoFocus;

  /// The text direction for the hint text.
  final TextDirection hintTextDirection;

  /// A function that validates the input and returns an error string if invalid.
  final String? Function(String?)? validator;

  /// The alignment of the text within the field.
  final TextAlign textAlign;

  /// An optional icon to display at the beginning of the text field.
  final Widget? prefixIcon;

  /// The text capitalization strategy.
  final TextCapitalization textCapitalization;

  /// The maximum number of lines for the helper text.
  final int? helperMaxLines;

  /// An optional widget to display as the character counter.
  final Widget? counter;

  /// Whether the text field should expand to fill its parent.
  final bool expands;

  /// The vertical alignment of the text.
  final TextAlignVertical textAlignVertical;

  /// The maximum number of lines for the hint text.
  final int hintMaxLines;

  /// Optional helper text to display below the field.
  final String? helperText;

  /// Optional label text to display above the field.
  final String? labelText;

  /// Whether the label and helper text are displayed inline or above/below the field.
  final bool isInline;

  /// The mode for autovalidating the input.
  final AutovalidateMode autovalidateMode;

  static const String _obscuringChar = '*';

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _textController;
  late InputState _currentState;

  @override
  void initState() {
    super.initState();
    _textController = widget.controller ?? TextEditingController();
    _currentState = widget.state;
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state != oldWidget.state) {
      _currentState = widget.state;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _textController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).color;
    final borders = _AppTextFieldBorders(context);

    // The field is explicitly disabled through the state property.
    final bool isEffectivelyEnabled =
        widget.isEnabled && _currentState != InputState.disabledState;

    return IgnorePointer(
      ignoring: !isEffectivelyEnabled,
      child: Opacity(
        opacity: isEffectivelyEnabled ? 1.0 : 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.isInline == false &&
                widget.labelText != null &&
                widget.labelText!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.x1),
                child: AppText.bodySmallStrong(
                  widget.labelText!,
                  color: colors.mainTextColor,
                ),
              ),
            _buildTextField(context, borders, isEffectivelyEnabled),
            if (widget.isInline == false &&
                widget.helperText != null &&
                widget.helperText!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.x1),
                child: AppText.bodyTinyStrong(
                  widget.helperText!,
                  maxLines: widget.helperMaxLines,
                  color: _currentState == InputState.dangerState
                      ? colors.errorColor
                      : colors.secondTextColor.withValues(alpha: 0.4),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    _AppTextFieldBorders borders,
    bool isEnabled,
  ) {
    final theme = AppTheme.of(context);
    final colors = theme.color;

    return TextFormField(
      scrollPadding:
          widget.scrollPadding ?? const EdgeInsets.all(AppSpacing.x1),
      textInputAction: widget.textInputAction,
      onTapOutside: widget.onTapOutside,
      enableSuggestions: widget.enableSuggestions,
      autocorrect: widget.autocorrect,
      onChanged: widget.onValueChange,
      onEditingComplete:
          widget.onEditingComplete ?? () => FocusScope.of(context).nextFocus(),
      onFieldSubmitted: (value) {
        widget.onFieldSubmitted?.call();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textCapitalization: widget.textCapitalization,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      validator: (value) {
        final error = widget.validator?.call(value);
        final hasError = error != null;
        final newState = hasError ? InputState.dangerState : widget.state;
        if (_currentState != newState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _currentState = newState;
              });
            }
          });
        }
        return error;
      },
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      controller: _textController,
      autofocus: widget.autoFocus,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      enabled: isEnabled,
      expands: widget.expands,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      cursorColor: colors.mainTextColor,
      style: widget.textStyle ??
          theme.text.bodyMedium.copyWith(
            color: _currentState == InputState.dangerState
                ? colors.errorColor
                : colors.mainTextColor,
          ),
      inputFormatters: widget.inputFormatters,
      obscuringCharacter: AppTextField._obscuringChar,
      autovalidateMode: widget.autovalidateMode,
      decoration: _buildInputDecoration(theme, borders),
    );
  }

  InputDecoration _buildInputDecoration(
    AppTheme theme,
    _AppTextFieldBorders borders,
  ) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: widget.hint,
      hintMaxLines: widget.hintMaxLines,
      hintTextDirection: widget.hintTextDirection,
      hintStyle: widget.hintStyle ??
          theme.text.bodyMedium.copyWith(color: theme.color.secondTextColor),
      counterStyle: widget.counterStyle ??
          theme.text.bodyMedium.copyWith(color: theme.color.secondTextColor),
      isDense: true,
      counter: widget.counter,
      prefixIcon: _buildIcon(widget.prefixIcon, isPrefix: true),
      suffixIcon: _buildIcon(widget.suffixIcon, isPrefix: false),
      suffixIconConstraints: const BoxConstraints(minWidth: AppSpacing.x10),
      prefixIconConstraints: const BoxConstraints(minWidth: AppSpacing.x10),
      enabledBorder: borders.defaultBorder,
      focusedBorder: borders.focusedBorder,
      errorBorder: borders.errorBorder,
      focusedErrorBorder: borders.errorBorder,
      disabledBorder: borders.defaultBorder,
      errorMaxLines: widget.helperMaxLines ?? 1,
      errorStyle: theme.text.bodyTinyStrong.copyWith(
        color: theme.color.errorColor,
      ),
      fillColor: Colors.transparent,
      filled: true,
      contentPadding: widget.contentPadding,
      border: borders.defaultBorder,
    );
  }

  Widget? _buildIcon(Widget? icon, {required bool isPrefix}) {
    if (icon == null) return null;

    final colors = AppTheme.of(context).color;
    final padding = EdgeInsetsDirectional.only(
      start: isPrefix ? AppSpacing.x3 : 0,
      end: isPrefix ? 0 : AppSpacing.x3,
    );

    final child = Padding(
      padding: padding,
      child: SizedBox(width: AppSpacing.x4, height: AppSpacing.x4, child: icon),
    );

    if (_currentState == InputState.dangerState) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(colors.errorColor, BlendMode.srcIn),
        child: child,
      );
    }
    return child;
  }
}

/// A helper class to provide themed borders for the [AppTextField].
class _AppTextFieldBorders {
  _AppTextFieldBorders(BuildContext context)
      : colors = AppTheme.of(context).color,
        borderRadius = BorderRadius.circular(AppRadius.x3);

  final ColorModel colors;
  final BorderRadius borderRadius;

  OutlineInputBorder get defaultBorder => OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide:
            BorderSide(color: colors.borderColor.withValues(alpha: 0.5)),
      );

  OutlineInputBorder get focusedBorder => OutlineInputBorder(
        borderSide: BorderSide(color: colors.primaryColor, width: 1.5),
        borderRadius: borderRadius,
      );

  OutlineInputBorder get errorBorder => OutlineInputBorder(
        borderSide: BorderSide(color: colors.errorColor, width: 1.5),
        borderRadius: borderRadius,
      );
}
