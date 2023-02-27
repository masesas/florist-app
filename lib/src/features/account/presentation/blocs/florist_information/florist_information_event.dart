part of 'florist_information_bloc.dart';

@immutable
abstract class FloristInformationEvent {}

class InitialFloristInformationEvent extends FloristInformationEvent {}

class SubmitUpdateFloristInformationEvent extends FloristInformationEvent {
  final FloristInformation floristInformation;

  SubmitUpdateFloristInformationEvent({
    required this.floristInformation,
  });
}
