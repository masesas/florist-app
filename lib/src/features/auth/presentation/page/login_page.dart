part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isShowPw = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isLoading) {
            context.showFullLoading();
          } else {
            context.hideFullLoading();
          }

          if (state.isSuccess) {
            Modular.to.navigate(Routes.HOME);
          } else if (state.isFailLogin &&
              (state.responseMessage ?? '').isNotEmpty) {
            context.dialogInfo(message: state.responseMessage ?? "");
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
                    Hero(
                      tag: HeroConstants.SPLASH_HERO,
                      child: Assets.icon.logoTitleappBlack.image(
                        scale: 1.5,
                      ),
                    ),
                    const SizedBox(height: AppSize.spaceBig),
                    Text(
                      AppLocalizations.of(context).login,
                      textAlign: TextAlign.center,
                      style: AppStyles.fontBold22.copyWith(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: AppSize.spaceDefault),
                    LoginWidgetFormBuilder(initState: (_, formModel) {
                      formModel.usernameControl?.value = 'FAIT';
                      formModel.passwordControl?.value = 'xxxxxx';
                    }, builder: (context, formModel, child) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ReactiveInputText(
                            hint: "Entry Your User ID",
                            title: context.lang.userId,
                            formControl: formModel.usernameControl,
                          ),
                          ReactiveInputText(
                            marginTop: AppSize.spaceSmall,
                            formControl: formModel.passwordControl,
                            title: context.lang.password,
                            hint: "Entry Your Password",
                            hideText: _isShowPw,
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
                          const SizedBox(height: 50),
                          BlocBuilder<AuthCubit, AuthState>(
                            buildWhen: (prev, curr) {
                              return prev.isLoading != curr.isLoading;
                            },
                            builder: (context, state) {
                              return ButtonPrimary(
                                width: double.maxFinite,
                                title: context.lang.login,
                                onClick: () {
                                  if (formModel.form.valid) {
                                    FocusScope.of(context).unfocus();
                                    context.read<AuthCubit>().login(
                                        formModel.usernameControl!.value!,
                                        formModel.passwordControl!.value!);
                                  }
                                },
                              );
                            },
                          )
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
