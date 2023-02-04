part of 'text_field.dart';

class TextFieldNoTitle extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final double fontSize;
  final double fontSizeHint;
  final List<TextInputFormatter> inputFormatter;
  final bool autoValidate;
  final bool readOnly;
  final FocusNode? initFocusNode;
  final FocusNode? nextFocusNode;
  final FormFieldValidator<String>? validation;
  final GestureTapCallback? onTap;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final EdgeInsets contentPadding;
  final EdgeInsets contentMargin;
  final VoidCallback? onEditingComplete;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Color fillColor;
  final Color textHintColor;
  final Color textColor;
  final Color borderColor;
  final Color errorColor;
  final bool obscureText;
  final String? initialValue;
  final double borderWidth;
  final int maxLines;
  final void Function(String value)? onChanged;
  final FormFieldSetter<String>? onSaved;
  final Function? onFieldSubmitted;
  final TextAlign textAlign;
  final Function(String)? onSubmitted;
  final FontWeight fontWeight;
  final double errorWidth;
  final bool autoFocus;
  final String? labelText;
  final TextStyle? labelStyle;

  const TextFieldNoTitle({
    Key? key,
    this.controller,
    this.hintText = "",
    this.fontSize = 14,
    this.fontSizeHint = 14,
    this.inputFormatter = const [],
    this.autoValidate = false,
    this.readOnly = false,
    this.initFocusNode,
    this.nextFocusNode,
    this.validation,
    this.onTap,
    this.initialValue,
    this.borderColor = Colors.transparent,
    this.errorColor = Colors.redAccent,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.borderWidth = 1.0,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.contentPadding = const EdgeInsets.only(
      left: 18,
      bottom: 15,
      right: 10,
      top: 15,
    ),
    this.contentMargin = const EdgeInsets.all(0),
    this.maxLines = 1,
    this.onEditingComplete,
    this.fillColor = Colors.white,
    this.textHintColor = Colors.grey,
    this.textColor = const Color(0xff060518),
    this.prefixIcon,
    this.suffix,
    this.textAlign = TextAlign.start,
    this.onSubmitted,
    this.fontWeight = FontWeight.w400,
    this.errorWidth = 1.0,
    this.autoFocus = false,
    this.labelText,
    this.labelStyle,
  }) : super(key: key);

  InputDecoration get _inputDecoration => InputDecoration(
        errorStyle: const TextStyle(color: Colors.redAccent),
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: fontSizeHint,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: errorColor,
            width: errorWidth,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: errorColor,
            width: errorWidth,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        fillColor: fillColor,
        filled: true,
        isDense: true,
        prefixIcon: prefixIcon,
        suffix: suffix,
        label: labelText != null ? Text(labelText!) : null,
        labelStyle: labelStyle,
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildInput(context),
      ],
    );
  }

  Widget _buildInput(BuildContext context) {
    return Container(
      margin: contentMargin,
      child: TextFormField(
        autofocus: autoFocus,
        textCapitalization: TextCapitalization.sentences,
        textAlign: textAlign,
        maxLines: maxLines,
        controller: controller,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        onTap: onTap,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validation,
        readOnly: readOnly,
        obscureText: obscureText,
        initialValue: initialValue,
        focusNode: initFocusNode ?? FocusNode(),
        autovalidateMode: autoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        inputFormatters: inputFormatter,
        onFieldSubmitted: (text) {
          if (initFocusNode != null) initFocusNode?.unfocus();
          if (onSubmitted != null) {
            onSubmitted!(text);
          }
          if (nextFocusNode == null) return;
          if (textInputAction == TextInputAction.next) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        decoration: _inputDecoration,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onSaved: onSaved,
      ),
    );
  }
}
