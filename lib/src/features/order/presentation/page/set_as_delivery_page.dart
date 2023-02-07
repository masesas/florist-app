part of 'pages.dart';

class SetAsDeliveryPage extends StatelessWidget {
  const SetAsDeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorGrey,
      appBar: AppBarForm(
        title: context.lang.setAsDelivery,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: BoxPrimary(
              padding: EdgeInsets.zero,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppSize.spaceDefault,
                ),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldNoInput(
                        title: context.lang.invoiceNumb,
                        content: "This is Logistic val",
                        marginTop: AppSize.spaceDefault,
                      ),
                      TextFieldNoInput(
                        title: context.lang.deliveryDate,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Vehicle val",
                      ),
                      TextFieldNoInput(
                        title: context.lang.sender,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      PhotoOrder(
                        title: context.lang.deliveryOrder,
                        imageProvider: Assets.icon.icAddPhoto.provider(),
                        marginTop: AppSize.spaceDefault,
                        helperText: context.lang.uploadImage,
                      ),
                      PhotoOrder(
                        title: context.lang.productImage,
                        imageProvider: Assets.icon.icAddPhoto.provider(),
                        marginTop: AppSize.spaceDefault,
                        marginBottom: AppSize.spaceDefault + 10,
                        helperText: context.lang.uploadImage,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ButtonPrimary(
              width: double.maxFinite,
              title: context.lang.submit.toUpperCase(),
              color: AppColors.buttonColor,
              textSize: 13,
              height: 40,
              onClick: () {},
            ),
          ),
        ],
      ),
    );
  }
}
