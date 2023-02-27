part of 'pages.dart';

class FloristInformationPage extends StatelessWidget {
  const FloristInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FloristInformationBloc(
        getProfileUserUseCase: Modular.get<GetProfileUserUseCase>(),
      )..add(InitialFloristInformationEvent()),
      child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: AppBarForm(
            title: context.lang.floristInformation,
          ),
          body: BlocConsumer<FloristInformationBloc, FloristInformationState>(
            listener: (context, state) {
              if (state is LoadingFloristInformationState) {
                context.showFullLoading();
              } else {
                context.hideFullLoading();
              }

              if (state is FailedLoadProfileFloristState) {
                context.dialogInfo(message: state.message);
              }
            },
            builder: (context, state) {
              final floristData = state.userEntity ?? const UserEntity();

              return FloristInformationFormBuilder(
                model: FloristInformation(
                  floristName: floristData.name,
                  contactPerson: floristData.phone,
                  email: floristData.email,
                ),
                builder: (context, formModel, child) {
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
                              ReactiveInputText(
                                title: context.lang.floristName,
                                formControl: formModel.floristNameControl,
                                readOnly: true,
                                hint: context.lang.floristName,
                                onTap: (value) {
                                  formModel.floristNameControl!
                                      .markAsDisabled();
                                },
                              ),
                              ReactiveInputText(
                                title: context.lang.contactNumber,
                                formControl: formModel.contactPersonControl,
                                marginTop: 20,
                                hint: context.lang.contactNumber,
                                onTap: (value) {
                                  formModel.contactPersonControl!
                                      .markAsDisabled();
                                },
                              ),
                              ReactiveInputText(
                                title: context.lang.email,
                                formControl: formModel.emailControl,
                                marginTop: 20,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
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
              );
            },
          )),
    );
  }
}
