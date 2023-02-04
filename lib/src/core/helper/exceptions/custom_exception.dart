part of 'exception.dart';

class CustomException implements Exception {
  String msg;
  int? code;

  CustomException({this.code, required this.msg});
}
