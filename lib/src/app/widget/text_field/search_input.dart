part of 'text_field.dart';

class SearchInput extends StatelessWidget {
  final String hintText;
  final double height;
  final Function(String?)? searchFunction;
  final void Function(String? value)? onChanged;

  SearchInput({
    Key? key,
    required this.hintText,
    this.height = 37,
    this.searchFunction,
    this.onChanged,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      height: height,
      child: InputTextField(
        textStyle: const TextStyle(
          color: AppColors.colorPrimaryDark,
        ),
        inputBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: AppColors.colorLoginBackground),
        ),
        color: AppColors.colorLoginBackground,
        textInputAction: TextInputAction.search,
        fontSize: 17,
        hintStyle: AppStyles.fontMedium10
            .copyWith(fontSize: 14, color: AppColors.colorTextHintPromo),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
        hintText: hintText,
        prefixIcon: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        suffixIcon: const Icon(
          Icons.search,
          size: 25,
        ),
        onEditingComplete: searchFunction != null
            ? () {
                searchFunction!(controller.text);
                FocusScope.of(context).unfocus();
              }
            : null,
        onChanged: onChanged,
      ),
    );
  }
}
