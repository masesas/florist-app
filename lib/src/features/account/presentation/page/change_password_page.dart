part of 'pages.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(
        changePasswordUseCase: Modular.get<ChangePasswordUseCase>(),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBarForm(
          title: context.lang.changePw,
        ),
        body: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is LoadingChangePassword) {
              context.showFullLoading();
            } else {
              context.hideFullLoading();
            }

            if (state is DoneChangePasswordState) {
              String message = state.message;
              if (state.isSuccess) {
                message = context.lang.updateSuccessfully(
                  '',
                  context.lang.password,
                );
              }
              context.dialogInfo(message: message);
            }
          },
          builder: (context, state) {
            return ChangePasswordFormBuilder(
                builder: (context, formModel, child) {
              bool hidePw = true;
              bool hidePwConfirm = true;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  BoxPrimary(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StatefulBuilder(
                            builder: (context, setState) {
                              return ReactiveInputText(
                                title: context.lang.newPw,
                                formControl: formModel.newPasswordControl,
                                marginTop: 20,
                                hideText: hidePw,
                                hint: context.lang.newPw,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    hidePw
                                        ? Icons.visibility
                                        : Icons.visibility_off_rounded,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      hidePw = !hidePw;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                          StatefulBuilder(
                            builder: (context, setState) {
                              return ReactiveInputText(
                                title: context.lang.confirmPw,
                                formControl: formModel.confirmPasswordControl,
                                marginTop: 20,
                                hint: context.lang.confirmPw,
                                hideText: hidePwConfirm,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    hidePwConfirm
                                        ? Icons.visibility
                                        : Icons.visibility_off_rounded,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      hidePwConfirm = !hidePwConfirm;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: ReactiveChangePasswordFormConsumer(
                      builder: (_, formModel, child) {
                        return ButtonPrimary(
                          title: context.lang.changePw.toUpperCase(),
                          color: formModel.form.valid
                              ? AppColors.buttonColor
                              : AppColors.btnDisabled,
                          onClick: () {
                            if (formModel.form.valid) {
                              _submit(context, formModel);
                            }
                          },
                        );
                      },
                    ),
                  )
                ],
              );
            });
          },
        ),
      ),
    );
  }

  void _submit(BuildContext context, ChangePasswordForm formModel) {
    context.read<ChangePasswordCubit>().submit(
          pw: formModel.model.newPassword,
          pwConfirm: formModel.model.confirmPassword,
        );
  }
}
