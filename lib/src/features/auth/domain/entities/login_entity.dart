part of 'entity.dart';

class LoginEntity extends Equatable {
  final String? token;
  final String? message;
  final int? expiresIn;

  const LoginEntity({
    this.token,
    this.message,
    this.expiresIn,
  });

  @override
  List<Object?> get props => [token, message, expiresIn];
}
