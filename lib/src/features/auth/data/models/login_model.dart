import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/entity.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginRequest {
  final String username;
  final String password;

  const LoginRequest({
    required this.username,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse extends LoginEntity {
  final dynamic error;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @override
  final String? message;
  @override
  @JsonKey(name: 'expires_in')
  final int? expiresIn;

  const LoginResponse({
    this.error,
    this.accessToken,
    this.tokenType,
    this.message,
    this.expiresIn,
  }) : super(
          token: accessToken ?? '',
          message: message ?? '',
          expiresIn: expiresIn,
        );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
