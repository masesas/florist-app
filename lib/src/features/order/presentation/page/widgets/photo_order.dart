part of 'widgets.dart';

class PhotoOrder extends StatelessWidget {
  final String title;
  final ImageProvider imageProvider;
  final Function()? onClick;
  final double? marginTop;
  final double? marginBottom;
  final String? helperText;
  final bool showBorder;

  const PhotoOrder({
    Key? key,
    required this.title,
    required this.imageProvider,
    this.onClick,
    this.marginTop,
    this.marginBottom,
    this.helperText,
    this.showBorder = true,
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
        children: [
          Text(
            title,
            style: AppStyles.fontBold14.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
          InkWell(
            onTap: onClick,
            child: Center(
              child: Container(
                width: 170,
                height: 170,
                margin: const EdgeInsets.only(
                  top: AppSize.spaceSmall,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  color: AppColors.colorBox,
                  borderRadius: BorderRadius.circular(10),
                  border: showBorder
                      ? Border.all(color: AppColors.colorBoxBorder)
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (helperText != null)
            Container(
              margin: const EdgeInsets.only(top: AppSize.spaceSmall),
              child: Text(helperText!),
            ),
        ],
      ),
    );
  }
}
