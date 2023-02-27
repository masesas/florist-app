part of 'widgets.dart';

class LoadingContent extends StatelessWidget {
  const LoadingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 100,
        height: 110,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(color: AppColors.buttonColor),
              ),
              const SizedBox(height: AppSize.spaceSmall),
              Text('Loading', style: AppStyles.fontSemiBold14),
            ],
          ),
        ),
      ),
    );
  }
}
