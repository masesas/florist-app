part of 'pages.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          Modular.get<AccountBloc>()..add(InitialAccountEvent()),
      child: Scaffold(
        backgroundColor: AppColors.bgColorGrey,
        body: BlocConsumer<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state is LogoutLoadingState) {
              context.showFullLoading();
            } else {
              context.hideFullLoading();
            }

            if (state is LogoutSuccessState) {
              Modular.to.navigate(Routes.SPLASH);
            } else if (state is LogoutFailState) {
              showDialogInfo(context: context, message: state.message);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSize.spaceDefault),
                _buildListItem(context, state),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, AccountState state) {
    return BoxPrimary(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildItem(
              title: context.lang.floristInformation,
              icon: Icons.home,
              onClick: () {
                Modular.to.pushNamed(
                  AccountModule.ACC_INFO,
                  arguments: state.userEntity,
                );
              },
            ),
            const Divider(
              color: AppColors.colorBackgroundGrey,
            ),
            _buildItem(
              title: context.lang.changeAddress,
              icon: Icons.location_pin,
              onClick: () =>
                  Modular.to.pushNamed(AccountModule.ACC_CHANGE_ADDRESS),
            ),
            const Divider(
              color: AppColors.colorBackgroundGrey,
            ),
            _buildItem(
              title: context.lang.changePw,
              icon: Icons.lock,
              onClick: () => Modular.to.pushNamed(AccountModule.ACC_CHANGE_PW),
            ),
            const Divider(
              color: AppColors.colorBackgroundGrey,
            ),
            _buildItem(
              title: context.lang.language,
              icon: Icons.language,
              onClick: () =>
                  Modular.to.pushNamed(AccountModule.ACC_CHANGE_LANG),
            ),
            const Divider(
              color: AppColors.colorBackgroundGrey,
            ),
            _buildItem(
              title: context.lang.logout,
              icon: Icons.logout,
              onClick: () => _showDialogLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required String title,
    required IconData icon,
    required Function() onClick,
  }) {
    return ListTile(
      title: Text(title, style: AppStyles.fontBold16),
      leading: Icon(
        icon,
        color: AppColors.grey70,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: onClick,
    );
  }

  void _showDialogLogout(BuildContext context) {
    Dialogs.materialDialog(
      context: context,
      barrierDismissible: false,
      customView: Padding(
        padding: const EdgeInsets.all(AppSize.spaceSmall),
        child: Column(
          children: [
            Text(
              context.lang.confirmation,
              style: AppStyles.fontBold22,
            ),
            const SizedBox(height: AppSize.spaceDefault),
            Text(
              context.lang.logoutConfirmation,
              style: AppStyles.fontSemiBold14.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
      actions: [
        ButtonPrimary(
          color: AppColors.btnDisabled,
          title: context.lang.no,
          onClick: () => Modular.to.pop(),
        ),
        ButtonPrimary(
          title: context.lang.logout,
          onClick: () => context.read<AccountBloc>().add(LogoutEvent()),
        ),
      ],
    );
  }
}
