part of 'pages.dart';

class RequestShippingPage extends StatelessWidget {
  const RequestShippingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorGrey,
      appBar: AppBarForm(
        title: context.lang.requestShipping,
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
                        title: context.lang.logistic,
                        content: "This is Logistic val",
                        marginTop: AppSize.spaceDefault,
                      ),
                      TextFieldNoInput(
                        title: context.lang.vehicle,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Vehicle val",
                      ),
                      TextFieldNoInput(
                        title: context.lang.pickupFrom,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      TextFieldNoInput(
                        title: context.lang.recipientAddress,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      TextFieldNoInput(
                        title: context.lang.recipientName,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      TextFieldNoInput(
                        title: context.lang.recipientContact,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      TextFieldNoInput(
                        title: context.lang.remark,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      TextFieldNoInput(
                        title: context.lang.scheduleProsses,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      TextFieldNoInput(
                        title: context.lang.scheduleTime,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: AppSize.spaceDefault),
                        height: 0.5,
                        color: AppColors.colorPrimaryDark,
                      ),
                      TextFieldNoInput(
                        title: context.lang.status,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      TextFieldNoInput(
                        title: context.lang.driverName,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      TextFieldNoInput(
                        title: context.lang.driverPlateNumb,
                        marginTop: AppSize.spaceDefault,
                        content: "This is Pickup val",
                      ),
                      PhotoOrder(
                        title: context.lang.driverPhoto,
                        imageProvider: Assets.icon.icNoPhoto.provider(),
                        marginTop: AppSize.spaceDefault,
                        marginBottom: AppSize.spaceDefault + 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
