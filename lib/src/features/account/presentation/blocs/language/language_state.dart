part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final LanguageEntity language;
  final List<LanguageEntity> languageList;
  final bool isSuccessChangeLanguage;

  const LanguageState._({
    required this.language,
    required this.languageList,
    this.isSuccessChangeLanguage = false,
  });

  LanguageState.initial(FetchLanguageUseCase fetchLanguageUseCase)
      : this._(
          language:
              LanguageModel.getCountryById(AppConstants.EN), // default language
          languageList: fetchLanguageUseCase.fetchCountries(),
        );

  LanguageState copyWith({
    LanguageEntity? language,
    List<LanguageEntity>? languageList,
    bool? isSuccessChangeLanguage,
  }) {
    return LanguageState._(
      language: language ?? this.language,
      languageList: languageList ?? this.languageList,
      isSuccessChangeLanguage:
          isSuccessChangeLanguage ?? this.isSuccessChangeLanguage,
    );
  }

  @override
  List<Object?> get props => [
        language,
        languageList,
      ];
}
