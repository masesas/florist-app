part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

class InitialAccountEvent extends AccountEvent {}

class LogoutEvent extends AccountEvent {}
