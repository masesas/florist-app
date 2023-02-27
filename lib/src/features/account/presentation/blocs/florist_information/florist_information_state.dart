part of 'florist_information_bloc.dart';

@immutable
abstract class FloristInformationState extends Equatable {
  final UserEntity? userEntity;

  const FloristInformationState({
    this.userEntity,
  });

  @override
  List<Object?> get props => [];
}

class FloristInformationInitial extends FloristInformationState {}

class LoadingFloristInformationState extends FloristInformationState {}

class FailedLoadProfileFloristState extends FloristInformationState {
  final String message;

  const FailedLoadProfileFloristState({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class LoadedFloristProfileData extends FloristInformationState {
  @override
  final UserEntity userEntity;

  const LoadedFloristProfileData({
    required this.userEntity,
  }) : super(
          userEntity: userEntity,
        );

  @override
  List<Object?> get props => [
        userEntity,
      ];
}

class SuccessUpdateState extends FloristInformationState {
  final String message;

  const SuccessUpdateState({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
