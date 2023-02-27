part of '../user_domain.dart';

abstract class UserRepository {
  /// * Get Florist Profile
  Future<UserEntity> getProfileUser({
    bool isFromCache = false,
  });
}
