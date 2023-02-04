import 'package:equatable/equatable.dart';
import 'package:florist_app/src/core/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/language_data.dart';
import '../../../domain/language_domain.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final FetchLanguageUseCase fetchLanguageUseCase;
  final ChangeLanguageUseCase changeLanguageUseCase;

  LanguageCubit({
    required this.fetchLanguageUseCase,
    required this.changeLanguageUseCase,
  }) : super(LanguageState.initial(fetchLanguageUseCase)) {
    fetchLanguage();
  }

  void fetchLanguage() async {
    final lang = await fetchLanguageUseCase.invoke();
    lang.fold((error) {}, (data) {
      emit(state.copyWith(
        language: data,
      ));
    });
  }

  void setSelectedLanguage(LanguageEntity language) {}

  void changeLanguage(LanguageEntity language) async {
    final change = await changeLanguageUseCase.invoke(language);
    change.fold((error) {}, (success) {
      emit(state.copyWith(
        language: language,
        isSuccessChangeLanguage: success,
      ));
    });
  }
}
