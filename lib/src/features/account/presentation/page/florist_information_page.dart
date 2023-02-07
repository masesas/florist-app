part of 'pages.dart';

class FloristInformationPage extends StatefulWidget {
  const FloristInformationPage({Key? key}) : super(key: key);

  @override
  State<FloristInformationPage> createState() => _FloristInformationPageState();
}

class _FloristInformationPageState extends State<FloristInformationPage> {
  final _floristInfoModel = const FloristInformation();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBarForm(
          title: context.lang.floristInformation,
        ),
        body: FloristInformationFormBuilder(
          model: _floristInfoModel,
          builder: (context, formModel, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                BoxPrimary(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReactiveInputText(
                          title: context.lang.floristName,
                          formControl: formModel.floristNameControl,
                          readOnly: true,
                          hint: context.lang.floristName,
                          borderAll: false,
                          onTap: (value) {
                            formModel.floristNameControl!.markAsDisabled();
                          },
                        ),
                        ReactiveInputText(
                          title: context.lang.contactNumber,
                          formControl: formModel.contactPersonControl,
                          marginTop: 20,
                          readOnly: true,
                          hint: context.lang.contactNumber,
                          onTap: (value) {
                            formModel.contactPersonControl!.markAsDisabled();
                          },
                        ),
                        ReactiveInputText(
                          title: context.lang.email,
                          formControl: formModel.emailControl,
                          marginTop: 20,
                          readOnly: true,
                          hint: context.lang.email,
                          onTap: (value) {
                            formModel.emailControl!.markAsDisabled();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ReactiveFloristInformationFormConsumer(
                      builder: (context, formModel, child) {
                        return ButtonPrimary(
                          title: context.lang.submit.toUpperCase(),
                          color: formModel.form.valid
                              ? AppColors.buttonColor
                              : AppColors.btnDisabled,
                          onClick: () {},
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
