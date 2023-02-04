part of '../../user_domain.dart';

class UserEntity extends Equatable {
  final String userId;
  final String floristName;
  final String contactPerson;
  final String email;
  final String address;
  final double latitude;
  final double longitude;

  const UserEntity({
    required this.userId,
    required this.floristName,
    required this.contactPerson,
    required this.email,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        floristName,
        contactPerson,
        email,
        address,
        latitude,
        longitude,
      ];
}
