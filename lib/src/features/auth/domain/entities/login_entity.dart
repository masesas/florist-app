part of 'entity.dart';

class LoginEntity extends Equatable {
  final String token;
  final String message;
  //final UserEntity userEntity;

  const LoginEntity({
    required this.token,
    required this.message,
    //required this.userEntity,
  });

  @override
  List<Object?> get props => [
        token,
        message,
        //userEntity,
      ];
}
