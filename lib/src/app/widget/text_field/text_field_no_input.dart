part of 'text_field.dart';

class TextFieldNoInput extends StatelessWidget {
  final String title;
  final String content;
  final double? marginTop;
  final double? marginBottom;
  final bool showHelperText;
  final Function(String? value)? onClick;

  const TextFieldNoInput({
    Key? key,
    required this.title,
    required this.content,
    this.marginTop,
    this.marginBottom,
    this.showHelperText = false,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: marginTop ?? 0.0,
        bottom: marginBottom ?? 0.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.fontBold14.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
          InkWell(
            onTap: () {
              if (onClick != null) {
                onClick!(content);
              }
            },
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: AppSize.spaceTitleWithField),
              decoration: BoxDecoration(
                color: AppColors.bgColorGrey,
                border: Border.all(color: AppColors.colorPrimary),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                content,
                style: AppStyles.fontBold14,
              ),
            ),
          ),
          if (showHelperText)
            Container(
                margin: const EdgeInsets.only(
                  top: AppSize.spaceTitleWithField,
                  left: AppSize.spaceTitleWithField,
                ),
                child: Text(
                  'this is helper text',
                  style: AppStyles.fontBold11.copyWith(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                    fontStyle: FontStyle.italic,
                  ),
                ))
        ],
      ),
    );
  }
}
