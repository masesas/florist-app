import 'package:json_annotation/json_annotation.dart';

part 'change_password_model.g.dart';

@JsonSerializable()
class ChangePasswordModel {
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  ChangePasswordModel({
    required this.password,
    required this.passwordConfirmation,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);
}

@JsonSerializable()
class ChangePasswordResponse {
  final int error;
  final String message;

  ChangePasswordResponse({
    this.error = 0,
    this.message = '',
  });

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);
}
