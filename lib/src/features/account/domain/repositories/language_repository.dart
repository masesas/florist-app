part of '../domain.dart';

abstract class LanguageRepository {
  /// get language default en (English)
  Future<LanguageEntity> fetchLanguage();

  /// return true if language successfully change
  Future<bool> changeLanguage(LanguageEntity language);

  /// get countries list language
  List<LanguageEntity> fetchCountries();
}
