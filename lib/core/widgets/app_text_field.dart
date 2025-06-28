import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pemo_test_project/core/core.dart';

enum DSInputState { defaultState, disabledState, dangerState }

class DSTextField extends StatefulWidget {
  const DSTextField({
    this.state = DSInputState.defaultState,
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
    super.key,
  });

  final TextEditingController? controller;
  final ScrollController? scrollController;
  final String? initialValue;
  final DSInputState state;
  final String hint;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final void Function(String value)? onValueChange;
  final void Function()? onEditingComplete;
  final void Function()? onFieldSubmitted;
  final TapRegionCallback? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;
  final bool isEnabled;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? counterStyle;
  final EdgeInsets contentPadding;
  final EdgeInsets? scrollPadding;
  final Widget? suffixIcon;
  final bool autoFocus;
  final TextDirection hintTextDirection;
  final String? Function(String?)? validator;
  final TextAlign textAlign;
  final Widget? prefixIcon;
  final TextCapitalization textCapitalization;
  final int? helperMaxLines;

  final Widget? counter;
  final bool expands;
  final TextAlignVertical textAlignVertical;
  final int hintMaxLines;

  final String? helperText;
  final String? labelText;
  final bool isInline;

  static const String _obscuringChar = '*';

  @override
  State<DSTextField> createState() => _DSTextFieldState();
}

class _DSTextFieldState extends State<DSTextField> {
  late ScrollController _textScrollController;

  late DSInputState _state;
  late String? _helperText;
  late TextEditingController _textController;

  final fieldKey = GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    _textScrollController = widget.scrollController ?? ScrollController();
    _textController = widget.controller ?? TextEditingController();
    _state = widget.state;
    _helperText = widget.helperText;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DSTextField oldWidget) {
    if (_state != DSInputState.dangerState) {
      _helperText = widget.helperText;
    }
    _state = widget.state;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _textController.dispose();
    _textScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputHelper = DSInputStatesHelper(context, _state);
    final theme = AppTheme.of(context);
    final colors = AppTheme.of(context).color;
    return IgnorePointer(
      ignoring: _state == DSInputState.disabledState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          if (widget.isInline == false &&
              widget.labelText != null &&
              widget.labelText!.isNotEmpty)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: AppSpacing.x1),
              child: AppText.bodySmallStrong(
                widget.labelText!,
                color: colors.mainTextColor,
              ),
            ),
          _buildTextField(context, inputHelper, theme),
          if (widget.isInline == false &&
              _helperText != null &&
              _helperText!.isNotEmpty &&
              fieldKey.currentState?.hasError == false)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: AppSpacing.x1),
              child: AppText.bodyTinyStrong(
                _helperText!,
                maxLines: widget.helperMaxLines,
                color:
                    _state == DSInputState.dangerState
                        ? colors.errorColor
                        : colors.secondTextColor.withValues(alpha: 0.4),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    DSInputStatesHelper inputHelper,
    AppTheme theme,
  ) {
    final colors = AppTheme.of(context).color;
    return Opacity(
      opacity: _state == DSInputState.disabledState ? 0.6 : 1,
      child: TextFormField(
        key: fieldKey,
        scrollController: _textScrollController,
        scrollPadding: widget.scrollPadding ?? EdgeInsets.all(AppSpacing.x1),
        textInputAction: widget.textInputAction,
        onTapOutside: widget.onTapOutside,
        enableSuggestions: widget.enableSuggestions,
        autocorrect: widget.autocorrect,
        onChanged: (value) {
          if (widget.onValueChange != null) {
            widget.onValueChange!(value);
          }

          if (widget.validator != null) {
            final validated = fieldKey.currentState?.validate() ?? true;

            if (validated == false && _state != DSInputState.dangerState) {
              setState(() {
                _state = DSInputState.dangerState;
              });
            } else if (validated == true &&
                _state != DSInputState.defaultState) {
              setState(() {
                _state = DSInputState.defaultState;
              });
            }
          }
        },
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
        onFieldSubmitted: (value) {
          if (widget.onFieldSubmitted != null) {
            widget.onFieldSubmitted!();
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        textCapitalization: widget.textCapitalization,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        validator: widget.validator,
        initialValue: widget.initialValue,
        focusNode: widget.focusNode,
        controller: _textController,
        autofocus: widget.autoFocus,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        enabled: widget.isEnabled,
        expands: widget.expands,
        obscureText: widget.obscureText,
        keyboardType: widget.textInputType,
        cursorColor: theme.color.mainTextColor,
        cursorHeight: AppSpacing.x5,
        style:
            widget.textStyle ??
            theme.text.bodyMedium.copyWith(
              color:
                  _state == DSInputState.dangerState
                      ? colors.errorColor
                      : colors.mainTextColor,
            ),
        inputFormatters: widget.inputFormatters,
        obscuringCharacter: DSTextField._obscuringChar,
        decoration: _buildInputDecoration(theme, inputHelper),
      ),
    );
  }

  Widget? _buildSuffixWidget(Widget? suffixIcon) {
    if (suffixIcon == null) {
      return null;
    }
    final colors = AppTheme.of(context).color;
    final paddedSuffix = Padding(
      padding: EdgeInsetsDirectional.only(end: AppSpacing.x1),
      child: SizedBox(
        width: AppSpacing.x4,
        height: AppSpacing.x4,
        child: suffixIcon,
      ),
    );
    return _state == DSInputState.dangerState
        ? ColorFiltered(
          colorFilter: ColorFilter.mode(colors.errorColor, BlendMode.srcIn),
          child: paddedSuffix,
        )
        : paddedSuffix;
  }

  Widget? _buildPrefixWidget(Widget? prefixIcon) {
    if (prefixIcon == null) {
      return null;
    }
    final colors = AppTheme.of(context).color;
    final paddedPrefix = Padding(
      padding: EdgeInsetsDirectional.only(start: AppSpacing.x1),
      child: SizedBox(
        width: AppSpacing.x4,
        height: AppSpacing.x4,
        child: prefixIcon,
      ),
    );

    return _state == DSInputState.dangerState
        ? ColorFiltered(
          colorFilter: ColorFilter.mode(colors.errorColor, BlendMode.srcIn),
          child: paddedPrefix,
        )
        : paddedPrefix;
  }

  InputDecoration _buildInputDecoration(
    AppTheme theme,
    DSInputStatesHelper inputHelper,
  ) {
    final colors = AppTheme.of(context).color;
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: widget.hint,
      hintMaxLines: widget.hintMaxLines,
      hintTextDirection: widget.hintTextDirection,
      hintStyle:
          widget.hintStyle ??
          theme.text.bodyMedium.copyWith(color: theme.color.secondTextColor),
      counterStyle:
          widget.hintStyle ??
          theme.text.bodyMedium.copyWith(color: theme.color.secondTextColor),
      isDense: true,
      counter: widget.counter,
      prefixIcon: _buildPrefixWidget(widget.prefixIcon),
      suffixIcon: _buildSuffixWidget(widget.suffixIcon),
      suffixIconConstraints: BoxConstraints(
        minWidth: AppSpacing.x5 + AppSpacing.x2,
      ),
      prefixIconConstraints: BoxConstraints(
        minWidth: AppSpacing.x5 + AppSpacing.x2,
      ),
      enabledBorder: inputHelper.defaultBorder,
      focusedBorder:
          (fieldKey.currentState?.isValid ?? true)
              ? inputHelper.focusBorder
              : inputHelper.defaultBorder,
      errorBorder: inputHelper.defaultBorder,
      focusedErrorBorder: inputHelper.defaultBorder,
      errorMaxLines: widget.helperMaxLines ?? 1,
      errorStyle: AppTheme.of(
        context,
      ).text.bodyTinyStrong.copyWith(color: colors.errorColor),
      disabledBorder: inputHelper.defaultBorder,
      fillColor: Colors.transparent,
      filled: true,
      contentPadding: widget.contentPadding,
      border: inputHelper.defaultBorder,
    );
  }
}

class DSInputStatesHelper {
  DSInputStatesHelper(this.context, this.state);

  final BuildContext context;
  final DSInputState state;

  final borderRadius = BorderRadius.circular(AppRadius.x3);

  OutlineInputBorder get focusBorder => OutlineInputBorder(
    borderSide: BorderSide(color: AppTheme.of(context).color.borderColor),
    borderRadius: borderRadius,
  );

  OutlineInputBorder get defaultBorder => OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(color: Colors.transparent),
  );
}
