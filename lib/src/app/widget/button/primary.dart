part of 'button.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final bool isLoading;
  final Color color;
  final bool isEnabled;
  final double? width;
  final double? height;
  final double? textSize;

  const ButtonPrimary({
    Key? key,
    required this.title,
    required this.onClick,
    this.isLoading = false,
    this.color = AppColors.buttonColorDark,
    this.isEnabled = true,
    this.width,
    this.height,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: SizedBox(
        height: height ?? 50,
        width: width,
        child: ElevatedButton(
          onPressed: isLoading ? null : onClick,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            backgroundColor: isLoading || !isEnabled
                ? AppColors.colorUnHighlightText
                : color,
          ),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return const SizedBox(
        height: 27,
        width: 27,
        child: CircularProgressIndicator(
          color: AppColors.colorPrimary,
        ),
      );
    } else {
      return Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyles.fontBold16.copyWith(
          color: AppColors.colorBackground,
          fontSize: textSize,
        ),
      );
    }
  }
}
