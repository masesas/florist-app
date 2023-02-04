part of 'text_field.dart';

class CustomReactiveTextField extends StatelessWidget {
  final String? hint;
  final String title;
  final String formName;
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

  const CustomReactiveTextField({
    required this.title,
    Key? key,
    this.validator,
    required this.formName,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            formControlName: formName,
            validationMessages: readOnly
                ? null
                : {
                    ValidationMessage.required: (error) =>
                        AppLocalizations.of(context).fieldRequired,
                    ValidationMessage.email: (error) =>
                        AppLocalizations.of(context).emailNotValid,
                    ValidationMessage.mustMatch: (error) =>
                        AppLocalizations.of(context).passwordNotMatch,
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
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.colorPrimary,
                      size: 18,
                    )
                  : suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
