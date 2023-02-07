part of 'pages.dart';

class RequestShippingFormPage extends StatefulWidget {
  const RequestShippingFormPage({Key? key}) : super(key: key);

  @override
  State<RequestShippingFormPage> createState() =>
      _RequestShippingFormPageState();
}

class _RequestShippingFormPageState extends State<RequestShippingFormPage> {
  final RequestShipping _requestShipping = const RequestShipping();

  final _vehicleItems = [
    const InputOptionEntity(value: "Motor"),
    const InputOptionEntity(value: "Mobil"),
  ];

  final _logisticItems = [
    const InputOptionEntity(value: "Lalamove"),
    const InputOptionEntity(value: "Teleport"),
  ];

  final _scheduleItems = [
    const InputOptionEntity(value: "No Schedule"),
    const InputOptionEntity(value: "Schedule"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorGrey,
      appBar: AppBarForm(
        title: context.lang.requestShipping,
      ),
      body: RequestShippingFormBuilder(
        model: _requestShipping,
        builder: (_, formModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: BoxPrimary(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReactiveInputOption<InputOptionEntity>(
                          title: context.lang.logistic,
                          formControl: formModel.logisticControl,
                          marginTop: 20,
                          listOption: _logisticItems,
                        ),
                        ReactiveInputOption<InputOptionEntity>(
                          title: context.lang.vehicle,
                          formControl: formModel.vehicleControl,
                          marginTop: 20,
                          listOption: _vehicleItems,
                        ),
                        ReactiveInputText(
                          title: context.lang.pickupFrom,
                          formControl: formModel.pickupFormControl,
                          readOnly: true,
                          hint: context.lang.pickupFrom,
                          borderAll: false,
                          marginTop: 20,
                        ),
                        ReactiveInputText(
                          title: context.lang.recipientAddress,
                          formControl: formModel.recipientAddressControl,
                          readOnly: true,
                          hint: context.lang.recipientAddress,
                          borderAll: false,
                          marginTop: 20,
                        ),
                        ReactiveInputText(
                          title: context.lang.recipientName,
                          formControl: formModel.pickupFormControl,
                          readOnly: true,
                          hint: context.lang.recipientName,
                          borderAll: false,
                          marginTop: 20,
                        ),
                        ReactiveInputText(
                          title: context.lang.recipientContact,
                          formControl: formModel.recipientContactControl,
                          readOnly: true,
                          hint: context.lang.recipientContact,
                          borderAll: false,
                          marginTop: 20,
                        ),
                        ReactiveInputText(
                          title: context.lang.remark,
                          formControl: formModel.remarkControl,
                          readOnly: true,
                          hint: context.lang.remark,
                          borderAll: false,
                          marginTop: 20,
                        ),
                        ReactiveInputOption<InputOptionEntity>(
                          title: context.lang.scheduleProsses,
                          formControl: formModel.scheduleProssesControl,
                          marginTop: 20,
                          listOption: _scheduleItems,
                        ),
                        ReactiveRequestShippingFormConsumer(
                          builder: (context, formModel, child) {
                            return Visibility(
                              visible:
                                  formModel.scheduleProssesControl?.value ==
                                      "Schedule",
                              child: ReactiveInputOption<InputOptionEntity>(
                                title: context.lang.scheduleTime,
                                formControl: formModel.scheduleTimeControl,
                                marginTop: 20,
                                listOption: _scheduleItems,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonPrimary(
                        title: context.lang.changeAddress.toUpperCase(),
                        color: AppColors.btnColor2nd,
                        textSize: 13,
                        height: 40,
                        onClick: () {},
                      ),
                    ),
                    const SizedBox(width: 15),
                    ReactiveRequestShippingFormConsumer(
                      builder: (context, formModel, child) {
                        return Expanded(
                          child: ButtonPrimary(
                            title: context.lang.requestPickup.toUpperCase(),
                            color: formModel.form.valid
                                ? AppColors.buttonColor
                                : AppColors.colorUnHighlightText,
                            textSize: 13,
                            height: 40,
                            onClick: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
