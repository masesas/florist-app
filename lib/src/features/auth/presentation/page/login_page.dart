part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AppLocalizations _localizations;
  final _form = FormGroup({
    ...CustomFormControl.userId,
    ...CustomFormControl.password,
  });

  @override
  void initState() {
    super.initState();
  }

  bool _isShowPw = false;

  @override
  Widget build(BuildContext context) {
    _localizations = AppLocalizations.of(context);

    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isSuccess) {
            SnackBarUtils(context).showSnackBar(state.responseMessage ?? "");

            Modular.to.navigate(Routes.HOME);
          }
        },
        child: SafeArea(
            child: Scaffold(
          body: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Assets.icon.logoTitleappBlack.image(
                      scale: 1.5,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      AppLocalizations.of(context).login,
                      textAlign: TextAlign.center,
                      style: AppStyles.fontBold22.copyWith(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ReactiveForm(
                      formGroup: _form,
                      child: Column(
                        children: [
                          CustomReactiveTextField(
                            title: AppLocalizations.of(context).userId,
                            formName: FormName.userId,
                            hint: "Entry Your User ID",
                          ),
                          const SizedBox(height: 20),
                          CustomReactiveTextField(
                            title: AppLocalizations.of(context).password,
                            formName: FormName.password,
                            hint: "Entry Your Password",
                            hideText: _isShowPw,
                            borderAll: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isShowPw
                                    ? Icons.visibility
                                    : Icons.visibility_off_rounded,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isShowPw = !_isShowPw;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (prev, curr) {
                        return prev.isLoading != curr.isLoading;
                      },
                      builder: (context, state) {
                        return ButtonPrimary(
                          title: AppLocalizations.of(context).login,
                          isLoading: state.isLoading,
                          onClick: () {
                            _form.markAllAsTouched();
                            if (_form.valid) {
                              context.read<AuthCubit>().login(_userId, _pw);
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  String get _userId => _form.control(FormName.userId).value.toString();

  String get _pw => _form.control(FormName.password).value.toString();
}
