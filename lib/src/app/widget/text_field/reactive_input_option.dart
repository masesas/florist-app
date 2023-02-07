part of 'text_field.dart';

class ReactiveInputOption<Entity extends InputOptionEntity>
    extends StatefulWidget {
  final String title;
  final FormControl<String>? formControl;
  final double? marginTop;
  final List<Entity> listOption;
  final Widget? prefixIcon;
  final bool disabled;
  final Function(Entity)? onChanged;
  final bool showSearchItem;

  const ReactiveInputOption({
    Key? key,
    required this.title,
    this.formControl,
    this.marginTop,
    required this.listOption,
    this.prefixIcon,
    this.disabled = false,
    this.onChanged,
    this.showSearchItem = false,
  }) : super(key: key);

  @override
  State<ReactiveInputOption> createState() => _ReactiveInputOptionState();
}

class _ReactiveInputOptionState<Entity extends InputOptionEntity>
    extends State<ReactiveInputOption<Entity>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.marginTop ?? 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppStyles.fontBold14,
          ),
          const SizedBox(
            height: 5,
          ),
          ReactiveTextField(
            formControl: widget.formControl,
            showCursor: false,
            readOnly: true,
            style: AppStyles.fontSemiBold14,
            onTap: (value) {
              _showDialogOption();
            },
            validationMessages: {
              ValidationMessage.required: (error) => context.lang.fieldRequired,
            },
            decoration: inputDecoration(
              "${context.lang.select} ${widget.title}",
              borderAll: true,
              colorFilled: widget.disabled ? AppColors.disabledTextField : null,
            ).copyWith(
              prefixIcon: widget.prefixIcon,
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.colorPrimaryDark,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchItem() {
    return Container();
  }

  void _showDialogOption() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          content: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          "${context.lang.select} ${widget.title}",
                          style: AppStyles.fontBold14,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Modular.to.pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: AppColors.colorBackgroundGrey,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(widget.listOption.length, (index) {
                      return _buildItem(
                        item: widget.listOption[index],
                        index: index,
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildItem({
    required Entity item,
    required int index,
  }) {
    bool isSelected =
        widget.formControl != null && widget.formControl!.value == item.value;

    return InkWell(
      onTap: () {
        if (widget.formControl != null) {
          widget.formControl!.value = widget.listOption[index].value;
        }
        if (widget.onChanged != null) {
          widget.onChanged!(widget.listOption[index]);
        }
        Modular.to.pop();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: widget.listOption.length != index + 1
                ? AppColors.grey70
                : Colors.transparent,
            width: 0.5,
          ),
        )),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.value,
                style: AppStyles.fontSemiBold14.copyWith(fontSize: 13),
              ),
            ),
            const SizedBox(width: 5),
            CircleCheckBox(isCheck: isSelected),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}
