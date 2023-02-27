part of '../domain.dart';

class FetchLanguageUseCase extends UseCaseWithoutParam<LanguageEntity> {
  final LanguageRepository languageRepository;

  FetchLanguageUseCase({required this.languageRepository});

  @override
  Future<Either<AppFailure, LanguageEntity>> execute() async {
    final lang = await languageRepository.fetchLanguage();
    return Right(lang);
  }

  List<LanguageEntity> fetchCountries() {
    return languageRepository.fetchCountries();
  }
}
