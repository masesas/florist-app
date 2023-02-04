part of 'box.dart';

class BoxPrimary extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double? radius;
  final bool showShadow;

  const BoxPrimary({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.radius,
    this.showShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 20),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: color ?? AppColors.colorBackground,
        borderRadius: BorderRadius.circular(radius ?? 10),
        boxShadow: showShadow
            ? [
                BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 3),
              ]
            : null,
      ),
      child: child,
    );
  }
}
