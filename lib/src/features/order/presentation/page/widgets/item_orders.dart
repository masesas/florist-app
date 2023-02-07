part of 'widgets.dart';

class ItemOrder extends StatelessWidget {
  final OrderEnum orderFlag;

  ItemOrder({
    Key? key,
    required this.orderFlag,
  }) : super(key: key);

  final styleNormal = AppStyles.fontSemiBold14.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w300,
  );

  @override
  Widget build(BuildContext context) {
    late String primaryTitleBtn;
    String? secondaryTitleBtn;
    Color? secondaryColorBtn;
    Widget? completedWidget;
    Function()? onClickPrimaryBtn; // primary indicate with right position
    Function()? onClickSecondaryBtn; // secondary indicate with left position

    switch (orderFlag) {
      case OrderEnum.NEW_ORDER:
        primaryTitleBtn = context.lang.accept;
        secondaryTitleBtn = context.lang.reject;
        break;
      case OrderEnum.ACCEPTED:
        primaryTitleBtn = context.lang.requestShipping;
        onClickPrimaryBtn = () {
          //Modular.to.pushNamed(OrderRoutes.ORDER_SHIPPING_FORM);
          Modular.to.pushNamed(OrderRoutes.ORDER_SHIPPING);
        };
        break;
      case OrderEnum.PREPARE_DELIVERY:
        primaryTitleBtn = context.lang.setAsDelivery;
        secondaryTitleBtn = context.lang.remindDriver;
        secondaryColorBtn = AppColors.colorUnHighlightText;
        onClickPrimaryBtn = () {
          Modular.to.pushNamed(OrderRoutes.ORDER_SET_AS_DELIVERY);
        };
        break;
      case OrderEnum.DELIVERED:
        completedWidget = Container(
          alignment: Alignment.center,
          child: Text('Completed', style: AppStyles.fontBold16),
        );
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BoxPrimary(
          radius: 2,
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: const Icon(Icons.image, size: 50)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('productId', style: styleNormal),
                      const SizedBox(height: 5),
                      Text(
                          'Product Name verasdasdy long namer and asadasdnaskndsad',
                          style: AppStyles.fontBold14),
                      const SizedBox(height: 5),
                      Text('Order Address', style: styleNormal),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    'D-Mm-yyyy',
                    style: styleNormal,
                  ),
                )
              ],
            ),
          ),
        ),
        BoxPrimary(
          radius: 2,
          showShadow: true,
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: completedWidget ??
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (secondaryTitleBtn != null)
                    Expanded(
                      child: ButtonPrimary(
                        title: secondaryTitleBtn,
                        color: secondaryColorBtn ?? AppColors.btnColor2nd,
                        height: 37,
                        onClick: () {},
                      ),
                    ),
                  if (secondaryTitleBtn != null) const SizedBox(width: 10),
                  Expanded(
                    child: ButtonPrimary(
                      title: primaryTitleBtn,
                      height: 37,
                      onClick: () {
                        if (onClickPrimaryBtn != null) {
                          onClickPrimaryBtn();
                        }
                      },
                    ),
                  ),
                ],
              ),
        )
      ],
    );
  }
}
