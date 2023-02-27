part of 'pages.dart';

class ChangeAddressPage extends StatefulWidget {
  //final AddressEntity addressEntity;

  const ChangeAddressPage({
    Key? key,
    //required this.addressEntity,
  }) : super(key: key);

  @override
  State<ChangeAddressPage> createState() => _ChangeAddressPageState();
}

class _ChangeAddressPageState extends State<ChangeAddressPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RequestPermissionBloc()
            ..add(
              RequestPermissionEvent(
                permissionType: PermissionType.LOCATION,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ChangeAddressBloc(
            changeAddressUseCase: Modular.get<ChangeAddressUseCase>(),
            getCacheUserProfileUseCase:
                Modular.get<GetCacheUserProfileUseCase>(),
          )..add(LoadAddressEvent()),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.bgColorGrey,
        appBar: AppBarForm(
          title: context.lang.changeAddress,
        ),
        body: BlocListener<RequestPermissionBloc, RequestPermissionState>(
          listener: (context, state) {
            if (state is CheckingPermissionState) {
              context.read<ChangeAddressBloc>().add(
                  const LocationPermissionEvent(isRequestPermission: true));
            } else if (state is PermissionGrantedState) {
              context
                  .read<ChangeAddressBloc>()
                  .add(const LocationPermissionEvent(isGranted: true));
            } else if (state is PermissionDeniedState) {
              context
                  .read<ChangeAddressBloc>()
                  .add(const LocationPermissionEvent(isGranted: false));
            }
          },
          child: BlocListener<ChangeAddressBloc, ChangeAddressState>(
            listener: (context, state) {
              if (state.isFullLoading) {
                context.showFullLoading();
              } else {
                context.hideFullLoading();
              }

              if (!state.isInitial && !state.isPermissionGranted) {
                context.dialogInfo(
                  message: context.lang.ignoreLocationPermission,
                  title: "Info",
                  btnText: context.lang.close,
                );
              }
              if (state.isSuccessUpdate) {
                context.dialogInfo(
                    message: context.lang
                        .updateSuccessfully('', context.lang.address));
              }
            },
            child: _buildForms(),
          ),
        ),
      ),
    );
  }

  Widget _buildForms() {
    return BlocBuilder<ChangeAddressBloc, ChangeAddressState>(
      builder: (context, state) {
        final changeAddressForm = state.formModel ?? ChangeAddress();

        return ChangeAddressFormBuilder(
          model: changeAddressForm,
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ReactiveInputText(
                          title: context.lang.address,
                          formControl: formModel.addressControl,
                          showCursor: false,
                          readOnly: true,
                          hint: context.lang.address,
                          textInputType: TextInputType.multiline,
                          onTap: (value) async {
                            _onTapAddress(formModel);
                          },
                        ),
                        ReactiveInputText(
                          marginTop: AppSize.spaceDefault,
                          title: context.lang.latitude,
                          formControl: formModel.latitudeControl,
                          disabled: true,
                          readOnly: true,
                          hint: context.lang.latitude,
                          onTap: (value) {
                            formModel.latitudeControl!.markAsDisabled();
                          },
                        ),
                        ReactiveInputText(
                          marginTop: AppSize.spaceDefault,
                          title: context.lang.longitude,
                          formControl: formModel.longitudeControl,
                          disabled: true,
                          readOnly: true,
                          hint: context.lang.longitude,
                          onTap: (value) {
                            formModel.longitudeControl!.markAsDisabled();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ReactiveChangeAddressFormConsumer(
                      builder: (context, formModel, child) {
                    return ButtonPrimary(
                      title: context.lang.changeAddress.toUpperCase(),
                      color: formModel.form.valid
                          ? AppColors.buttonColor
                          : AppColors.btnDisabled,
                      onClick: () async {
                        if (formModel.form.valid) {
                          _changeAddress(context, formModel);
                        }
                      },
                    );
                  }),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _onTapAddress(ChangeAddressForm formModel) async {
    FocusScope.of(context).unfocus();
    /* await Modular.to.pushNamed(SharedModule.SHARED_MAPS).then((value) {
      _onAddressPop(formModel, value);
    });*/
    await Modular.get<AccountModule>().navigateToGoogleMaps().then((value) {
      _onAddressPop(formModel, value);
    });
  }

  void _onAddressPop(ChangeAddressForm formModel, dynamic value) {
    if (value != null && value is PlaceEntity) {
      formModel.addressControl!.value = value.address;
      formModel.latitudeControl!.value = value.latitude.toString();
      formModel.longitudeControl!.value = value.longitude.toString();
      formModel.model.zipCode = value.postalCode;
      formModel.form.markAllAsTouched();
    }
  }

  void _changeAddress(BuildContext context, ChangeAddressForm formModel) {
    context.read<ChangeAddressBloc>().add(
          SubmitChangeAddressEvent(
            addressEntity: AddressEntity(
              address: formModel.model.address,
              latitude: formModel.model.latitude,
              longitude: formModel.model.longitude,
              zipCode: formModel.model.zipCode,
            ),
          ),
        );
  }
}
