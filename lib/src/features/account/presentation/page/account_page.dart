part of 'pages.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    //LoggerUtils.printInfo("ACCOUNT INIT");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildDataAnalysis(),
          const SizedBox(height: 20),
          _buildListItem(),
        ],
      ),
    );
  }

  Widget _buildDataAnalysis() {
    return const BoxPrimary(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Center(child: Text('This is Data')),
    ));
  }

  Widget _buildListItem() {
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
                  Modular.to.pushNamed(AccountRoutes.ACC_INFO);
                }),
            const Divider(
              color: AppColors.colorBackgroundGrey,
            ),
            _buildItem(
              title: context.lang.changeAddress,
              icon: Icons.location_pin,
              onClick: () =>
                  Modular.to.pushNamed(AccountRoutes.ACC_CHANGE_ADDRESS),
            ),
            const Divider(
              color: AppColors.colorBackgroundGrey,
            ),
            _buildItem(
              title: context.lang.changePw,
              icon: Icons.lock,
              onClick: () => Modular.to.pushNamed(AccountRoutes.ACC_CHANGE_PW),
            ),
            const Divider(
              color: AppColors.colorBackgroundGrey,
            ),
            _buildItem(
              title: context.lang.language,
              icon: Icons.language,
              onClick: () =>
                  Modular.to.pushNamed(AccountRoutes.ACC_CHANGE_LANG),
            ),
            const Divider(
              color: AppColors.colorBackgroundGrey,
            ),
            _buildItem(
              title: context.lang.logout,
              icon: Icons.logout,
              onClick: () => showDialogConfirmation(context,
                  message: context.lang.logoutConfirmation, onYes: () {
                Modular.to.pop();
              }),
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
}
