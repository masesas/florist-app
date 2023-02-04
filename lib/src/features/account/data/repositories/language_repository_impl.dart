part of '../language_data.dart';

class LanguageRepositoryImpl extends LanguageRepository {
  final SharePrefUtils sharePref;

  LanguageRepositoryImpl({
    required this.sharePref,
  });

  @override
  Future<bool> changeLanguage(LanguageEntity language) async {
    return await sharePref.setLanguage(language.id);
  }

  @override
  Future<LanguageEntity> fetchLanguage() async {
    final langId = await sharePref.getLanguage() ?? AppConstants.EN;
    return LanguageModel.getCountryById(langId);
  }

  @override
  List<LanguageEntity> fetchCountries() {
    List<LanguageModel> countries = [
      LanguageModel(
        id: AppConstants.ID,
        name: 'Indonesia',
        image: Assets.icon.icId.image(
          height: 25,
        ),
      ),
      LanguageModel(
        id: AppConstants.EN,
        name: 'English',
        image: Assets.icon.icUk.image(
          height: 25,
        ),
      ),
    ];

    return countries;
  }
}
