part of '../language_data.dart';

class LanguageModel extends LanguageEntity {
  const LanguageModel({
    required String id,
    required String name,
    required Image image,
  }) : super(
          id: id,
          name: name,
          image: image,
        );

  factory LanguageModel.getCountryById(String id) {
    switch (id) {
      case AppConstants.ID:
        return LanguageModel(
          id: AppConstants.ID,
          name: 'Indonesia',
          image: Assets.icon.icId.image(),
        );
      default:
        return LanguageModel(
          id: AppConstants.EN,
          name: 'English',
          image: Assets.icon.icUk.image(),
        );
    }
  }
}
