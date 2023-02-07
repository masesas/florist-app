part of 'pages.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _changePw = ChangePassword();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBarForm(
        title: context.lang.changePw,
      ),
      body: ChangePasswordFormBuilder(builder: (context, formModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            BoxPrimary(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReactiveInputText(
                      title: context.lang.newPw,
                      formControl: formModel.newPasswordControl,
                      marginTop: 20,
                      readOnly: true,
                      hint: context.lang.newPw,
                      borderAll: false,
                    ),
                    ReactiveInputText(
                      title: context.lang.confirmPw,
                      formControl: formModel.newPasswordControl,
                      marginTop: 20,
                      readOnly: true,
                      hint: context.lang.confirmPw,
                    ),
                  ],
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
        );
      }),
    );
  }
}
