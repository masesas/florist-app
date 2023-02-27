part of '../domain.dart';

abstract class AccountRepository {
  /// * Logout App Will Clean All local data
  Future<bool> logoutApp();

  /// * Update Address
  Future<UserEntity> updateAddress(AddressEntity addressEntity);

  /// * Update Password
  Future<String> updatePassword(String password, String passwordConfirmation);
}
