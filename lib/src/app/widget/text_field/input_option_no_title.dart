part of 'text_field.dart';

class InputOptionNoTitle<Entity> extends StatelessWidget {
  final List<Entity> options;
  final Entity? optionSelected;
  final String? hint;
  final String Function(Entity option) buildTextSelected;
  final String Function(Entity option) buildTextOption;
  final String Function(Entity option, int index)? builder;
  final void Function(Entity option)? onChanged;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;

  const InputOptionNoTitle({
    Key? key,
    required this.options,
    this.optionSelected,
    this.hint,
    required this.buildTextSelected,
    required this.buildTextOption,
    this.builder,
    this.onChanged,
    this.prefixIcon,
    this.borderRadius,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius ?? BorderRadius.circular(6),
              border: Border.all(color: AppColors.greyEA, width: 0.5),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 11,
            ),
            child: Row(
              children: [
                prefixIcon ?? const SizedBox(),
                Expanded(
                  child: Text(
                    optionSelected == null
                        ? hint ?? context.lang.selectOption
                        : buildTextSelected(optionSelected!),
                    style: AppStyles.fontMedium10.copyWith(
                      fontSize: 11,
                      color: AppColors.grey53.withOpacity(
                        optionSelected == null ? 0.5 : 1,
                      ),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
