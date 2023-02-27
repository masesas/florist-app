part of 'repositories.dart';

class AccountRepositoryImpl extends AccountRepository {
  final AccountLocalDataSource accountLocalDataSource;
  final AccountRetrofitServices accountRetrofitServices;
  final AccountServices accountServices;
  final UserLocalDataSource userLocalDataSource;

  AccountRepositoryImpl({
    required this.accountLocalDataSource,
    required this.accountRetrofitServices,
    required this.accountServices,
    required this.userLocalDataSource,
  });

  @override
  Future<bool> logoutApp() async {
    return await accountLocalDataSource.logout();
  }

  @override
  Future<UserEntity> updateAddress(AddressEntity addressEntity) async {
    final data = await accountServices
        .updateAddress(ChangeAddressModel.fromEntity(addressEntity));
    if (data.error == 0 && data.user != null) {
      //await userLocalDataSource.cacheUser(data.user!);
      //await Modular.get<UserLocalDataSource>().cacheUser(data.user!);
      return data.user!;
    }

    throw CustomException(msg: data.message);
  }

  @override
  Future<String> updatePassword(
      String password, String passwordConfirmation) async {
    final data = await accountServices.changePassword(
      ChangePasswordModel(
          password: password, passwordConfirmation: passwordConfirmation),
    );
    if (data.error == 0) {
      return data.message;
    }

    throw CustomException(msg: data.message);
  }
}
