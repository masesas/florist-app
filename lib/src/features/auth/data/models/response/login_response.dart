import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entity.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends LoginEntity {
  const LoginResponse({
    String? accessToken,
    String? tokenType,
    String? message,
    int? error,
  }) : super(
          token: accessToken ?? '',
          message: message ?? '',
        );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
