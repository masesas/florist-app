import 'package:json_annotation/json_annotation.dart';

import '../../../domain/user_domain.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required String userId,
    required String floristName,
    required String contactPerson,
    required String email,
    String? address,
    double? latitude,
    double? longitude,
  }) : super(
          userId: userId,
          floristName: floristName,
          contactPerson: contactPerson,
          email: email,
          address: address ?? "",
          latitude: latitude ?? 0.0,
          longitude: longitude ?? 0.0,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
