part of '../domain.dart';

class ChangeLanguageUseCase extends UseCase<LanguageEntity, bool> {
  final LanguageRepository languageRepository;

  ChangeLanguageUseCase({required this.languageRepository});

  @override
  Future<Either<AppFailure, bool>> execute(LanguageEntity param) async {
    await languageRepository.changeLanguage(param);
    return const Right(true);
  }
}
