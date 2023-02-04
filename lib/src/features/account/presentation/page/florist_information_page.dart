part of 'pages.dart';

class FloristInformationPage extends StatefulWidget {
  const FloristInformationPage({Key? key}) : super(key: key);

  @override
  State<FloristInformationPage> createState() => _FloristInformationPageState();
}

class _FloristInformationPageState extends State<FloristInformationPage> {
  final _form = FormGroup(
    {
      ...FloristInformationForm.floristName,
      ...FloristInformationForm.contactNumber,
      ...FloristInformationForm.email,
    },
    disabled: true,
  );

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            BoxPrimary(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: ReactiveForm(
                formGroup: _form,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomReactiveTextField(
                        title: context.lang.floristName,
                        formName: FloristInformationForm.FLORIST_NAME,
                        readOnly: true,
                        hint: context.lang.floristName,
                        borderAll: false,
                      ),
                      const SizedBox(height: 20),
                      CustomReactiveTextField(
                        title: context.lang.contactNumber,
                        formName: FloristInformationForm.CONTACT_NUMBER,
                        readOnly: true,
                        hint: context.lang.contactNumber,
                      ),
                      const SizedBox(height: 20),
                      CustomReactiveTextField(
                        title: context.lang.email,
                        formName: FloristInformationForm.EMAIL,
                        readOnly: true,
                        hint: context.lang.email,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.maxFinite,
                child: ButtonPrimary(
                    title: context.lang.submit.toUpperCase(),
                    color: AppColors.buttonColor,
                    onClick: () {}),
              ),
            )
          ],
        ));
  }
}
