part of 'text_field.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Color? hintColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? initialValue;
  final double? fontSize;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autoValidate;
  final bool? autoFocus;
  final bool? obscureText;
  final FocusNode? initFocusNode;
  final FocusNode? nextFocusNode;
  final String? Function(String?)? validation;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final EdgeInsets? contentPadding;
  final EdgeInsets? margin;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? counterEnabled;
  final void Function(String? value)? onChanged;
  final void Function(String? value)? onSaved;
  final void Function()? onEditingComplete;
  final bool? enabled;
  final void Function()? onPressed;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputDecoration? decoration;
  final InputBorder? inputBorder;
  final bool? filled;
  final bool? isDense;
  final TextAlign? textAlign;
  final String obscuringCharacter;
  final EdgeInsets? labelPadding;
  final Color? color;
  final Color? cursorColor;
  final String? labelTrailing;
  final Function? actionTrailing;
  final double borderRadius;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final Color borderColor;
  final OutlineInputBorder? focusBorder;
  final Widget? trailing;
  final String? prefixText;
  final TextStyle? errorStyle;

  final inputBorderDefault = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0.5),
  );

  final inputBorderFilled = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.colorBorderInput),
  );

  const InputTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.labelStyle,
    this.labelPadding,
    this.hintText,
    this.hintColor,
    this.hintStyle,
    this.initialValue,
    this.fontSize,
    this.inputFormatters,
    this.autoValidate,
    this.autoFocus,
    this.initFocusNode,
    this.nextFocusNode,
    this.validation,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.contentPadding,
    this.margin,
    this.textStyle,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.counterEnabled = true,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.enabled,
    this.onPressed,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.decoration,
    this.inputBorder,
    this.filled = true,
    this.isDense = true,
    this.textAlign = TextAlign.left,
    this.obscuringCharacter = '●',
    this.color,
    this.cursorColor,
    this.labelTrailing,
    this.actionTrailing,
    this.borderRadius = 0,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.borderColor = AppColors.colorBorderInput,
    this.focusBorder,
    this.trailing,
    this.prefixText,
    this.errorStyle,
  }) : super(key: key);

  final _defaultTextStyle =
      const TextStyle(fontSize: 14, color: AppColors.colorText);
  final _defaultHintStyle =
      const TextStyle(fontSize: 14, color: AppColors.colorUnHighlightText);
  final _defaultLabelStyle = const TextStyle(
    fontSize: 14,
    color: AppColors.colorLabelText,
  );

  @override
  Widget build(BuildContext context) {
    if (labelText != null) {
      return Container(
        margin: margin ?? EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: labelPadding ?? EdgeInsets.zero,
              child: Row(
                children: [
                  Text(labelText ?? "",
                      style: labelStyle ?? _defaultLabelStyle),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        if (actionTrailing != null) {
                          actionTrailing!();
                        }
                      },
                      child: trailing ??
                          Text(labelTrailing ?? "",
                              style: _defaultLabelStyle.copyWith(
                                  color: AppColors.colorTextOption))),
                ],
              ),
            ),
            _buildTextField(context)
          ],
        ),
      );
    } else {
      return Container(
        margin: margin ?? EdgeInsets.zero,
        child: _buildTextField(context),
      );
    }
  }

  Widget _buildTextField(BuildContext context) {
    final inputBorder = this.inputBorder ??
        (filled!
            ? inputBorderFilled.copyWith(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor))
            : inputBorderDefault);
    final _errorStyle = errorStyle ??
        (textStyle != null
            ? textStyle!.copyWith(color: Colors.red)
            : _defaultTextStyle.copyWith(color: Colors.red));

    return TextFormField(
      style: textStyle ?? _defaultTextStyle.copyWith(fontSize: fontSize),
      controller: controller,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validation,
      focusNode: initFocusNode,
      autovalidateMode: autoValidate ?? false
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      autofocus: autoFocus ?? false,
      onTap: onPressed,
      initialValue: initialValue,
      inputFormatters: inputFormatters ?? [],
      onFieldSubmitted: _onFieldSubmitted(context),
      minLines: obscureText! ? 1 : minLines,
      maxLines: obscureText! ? 1 : maxLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      enabled: enabled ?? true,
      readOnly: readOnly ?? false,
      textAlign: textAlign!,
      cursorColor: cursorColor ?? AppColors.colorBoldText,
      // obscuringCharacter: obscuringCharacter,
      decoration: decoration ??
          InputDecoration(
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            filled: filled,
            fillColor: color ?? AppColors.colorBackgroundInput,
            border: inputBorder,
            errorBorder: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: focusBorder ?? inputBorder,
            focusedErrorBorder: inputBorder,
            disabledBorder: inputBorder,
            prefixText: prefixText,
            hintText: hintText ?? "",
            hintStyle: hintStyle ??
                _defaultHintStyle.copyWith(
                  fontSize: fontSize,
                  color: hintColor,
                ),
            errorStyle: _errorStyle,
            errorMaxLines: 2,
            counterText: counterEnabled! ? null : "",
            counterStyle: const TextStyle(color: Colors.black),
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
            isDense: isDense,
          ),
    );
  }

  Function(String) _onFieldSubmitted(BuildContext context) {
    return (value) {
      if (initFocusNode != null) initFocusNode!.unfocus();
      if (nextFocusNode != null) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      }
    };
  }
}
