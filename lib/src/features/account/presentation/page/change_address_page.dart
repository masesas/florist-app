part of 'pages.dart';

class ChangeAddressPage extends StatefulWidget {
  const ChangeAddressPage({Key? key}) : super(key: key);

  @override
  State<ChangeAddressPage> createState() => _ChangeAddressPageState();
}

class _ChangeAddressPageState extends State<ChangeAddressPage> {
  final _floristInfoModel = const FloristInformation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorGrey,
      appBar: AppBarForm(
        title: context.lang.changeAddress,
      ),
      body: FloristInformationFormBuilder(
          model: _floristInfoModel,
          builder: (context, formModel, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: BoxPrimary(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReactiveInputText(
                            title: context.lang.address,
                            formControl: formModel.addressControl,
                            readOnly: true,
                            hint: context.lang.address,
                            onTap: (value) {
                              formModel.addressControl!.markAsDisabled();
                            },
                          ),
                          const SizedBox(height: 20),
                          ReactiveInputText(
                            title: context.lang.latitude,
                            formControl: formModel.latitudeControl,
                            readOnly: true,
                            hint: context.lang.latitude,
                            onTap: (value) {
                              formModel.latitudeControl!.markAsDisabled();
                            },
                          ),
                          const SizedBox(height: 20),
                          ReactiveInputText(
                            title: context.lang.longitude,
                            formControl: formModel.longitudeControl,
                            readOnly: true,
                            hint: context.lang.longitude,
                            onTap: (value) {
                              formModel.longitudeControl!.markAsDisabled();
                            },
                          ),
                          const SizedBox(height: 20),
                          const Card(
                            elevation: 5,
                            child: SizedBox(
                              height: 200,
                              width: double.maxFinite,
                              child: Center(
                                child: Text("This is Maps"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ReactiveFloristInformationFormConsumer(
                      builder: (context, formModel, child) {
                    return ButtonPrimary(
                      title: context.lang.changeAddress.toUpperCase(),
                      color: formModel.form.valid
                          ? AppColors.buttonColor
                          : AppColors.btnDisabled,
                      onClick: () {},
                    );
                  }),
                )
              ],
            );
          }),
    );
  }
}
