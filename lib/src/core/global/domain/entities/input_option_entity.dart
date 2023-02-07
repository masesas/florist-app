import 'package:equatable/equatable.dart';

class InputOptionEntity extends Equatable {
  final int? id;
  final String value;
  final String? code;

  const InputOptionEntity({
    this.id,
    required this.value,
    this.code,
  });

  @override
  List<Object?> get props => [
        id,
        value,
        code,
      ];
}
