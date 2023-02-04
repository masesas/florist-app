part of 'app_bar.dart';

class AppBarForm extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isCentered;
  final List<Widget>? actions;
  final Function()? onBack;

  @override
  final Size preferredSize;

  AppBarForm({
    Key? key,
    required this.title,
    this.isCentered = true,
    this.onBack,
    this.actions,
  })  : preferredSize = const Size.fromHeight(55),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: AppStyles.fontBold16.copyWith(
            fontWeight: FontWeight.w600,
          )),
      elevation: 1,
      backgroundColor: AppColors.colorBackground,
      centerTitle: isCentered,
      leading: BackButton(
        color: Colors.black,
        onPressed: (onBack == null) ? () => Modular.to.pop() : onBack,
      ),
      actions: actions,
    );
  }
}
