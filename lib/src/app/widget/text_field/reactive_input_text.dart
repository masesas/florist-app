part of 'text_field.dart';

class ReactiveInputText extends StatelessWidget {
  final String? hint;
  final String title;
  final String? formName;
  final FormControl<dynamic>? formControl;
  final String? Function(String? v)? validator;
  final Widget? icon;
  final bool hideText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool readOnly;
  final bool showArrow;
  final Function(FormControl<dynamic>)? onTap;
  final bool borderAll;
  final Widget? suffixIcon;
  final double? marginTop;
  final bool showCursor;

  const ReactiveInputText({
    required this.title,
    Key? key,
    this.validator,
    this.formName,
    required this.formControl,
    this.hint,
    this.onTap,
    this.hideText = false,
    this.textInputType = TextInputType.text,
    this.icon,
    this.showArrow = false,
    this.borderAll = false,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.marginTop,
    this.showCursor = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: AppStyles.fontBold14,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: ReactiveTextField(
              showCursor: showCursor && !readOnly,
              formControlName: formName,
              formControl: formControl,
              validationMessages: readOnly
                  ? null
                  : {
                      ValidationMessage.required: (error) =>
                          context.lang.fieldRequired,
                      ValidationMessage.email: (error) =>
                          context.lang.emailNotValid,
                      ValidationMessage.mustMatch: (error) =>
                          context.lang.passwordNotMatch,
                      //ValidationMessage.minLength: (error) => 'Minimal 8 karakter',
                    },
              style: AppStyles.fontSemiBold14,
              onTap: onTap,
              readOnly: readOnly,
              textInputAction: textInputAction,
              keyboardType: title.toLowerCase().contains("email")
                  ? TextInputType.emailAddress
                  : textInputType,
              obscureText: hideText,
              minLines: 1,
              decoration: inputDecoration(
                hint,
                borderAll: borderAll,
                colorFilled: readOnly ? AppColors.disabledTextField : null,
              ).copyWith(
                prefixIcon: icon,
                suffixIcon: showArrow
                    ? const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.colorPrimary,
                        size: 18,
                      )
                    : suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
