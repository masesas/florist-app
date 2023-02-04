part of 'pages.dart';

class ChangeAddressPage extends StatefulWidget {
  const ChangeAddressPage({Key? key}) : super(key: key);

  @override
  State<ChangeAddressPage> createState() => _ChangeAddressPageState();
}

class _ChangeAddressPageState extends State<ChangeAddressPage> {
  final _form = FormGroup(
    {
      ...ChangeAddressForm.address,
      ...ChangeAddressForm.latitude,
      ...ChangeAddressForm.longitude,
    },
    disabled: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBarForm(
        title: context.lang.changeAddress,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: BoxPrimary(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: ReactiveForm(
                formGroup: _form,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomReactiveTextField(
                        title: context.lang.address,
                        formName: ChangeAddressForm.ADDRESS,
                        readOnly: true,
                        hint: context.lang.address,
                        borderAll: false,
                      ),
                      const SizedBox(height: 20),
                      CustomReactiveTextField(
                        title: context.lang.latitude,
                        formName: ChangeAddressForm.LATITUDE,
                        readOnly: true,
                        hint: context.lang.latitude,
                      ),
                      const SizedBox(height: 20),
                      CustomReactiveTextField(
                        title: context.lang.longitude,
                        formName: ChangeAddressForm.LONGITUDE,
                        readOnly: true,
                        hint: context.lang.longitude,
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ButtonPrimary(
              title: context.lang.changeAddress.toUpperCase(),
              color: AppColors.buttonColor,
              onClick: () {},
            ),
          )
        ],
      ),
    );
  }
}
