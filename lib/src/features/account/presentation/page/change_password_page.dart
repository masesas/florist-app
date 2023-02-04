part of 'pages.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _form = FormGroup(
    {
      ...ChangePasswordForm.newPw,
      ...ChangePasswordForm.confirmPw,
    },
    disabled: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBarForm(
        title: context.lang.changePw,
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
                      title: context.lang.newPw,
                      formName: ChangePasswordForm.NEW_PW,
                      readOnly: true,
                      hint: context.lang.newPw,
                      borderAll: false,
                    ),
                    const SizedBox(height: 20),
                    CustomReactiveTextField(
                      title: context.lang.confirmPw,
                      formName: ChangePasswordForm.CONFIRM_PW,
                      readOnly: true,
                      hint: context.lang.confirmPw,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ButtonPrimary(
              title: context.lang.changePw.toUpperCase(),
              color: AppColors.buttonColor,
              onClick: () {},
            ),
          )
        ],
      ),
    );
  }
}
