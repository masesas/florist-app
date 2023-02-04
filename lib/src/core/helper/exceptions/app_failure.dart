part of 'exception.dart';

class AppFailure {
  AppFailure({this.code, required this.msg});

  String msg;
  int? code;
}
