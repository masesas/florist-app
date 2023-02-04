part of '../language_domain.dart';

class LanguageEntity extends Equatable {
  final String id;
  final String name;
  final Image image;

  const LanguageEntity({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
