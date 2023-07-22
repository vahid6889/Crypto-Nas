import 'package:bloc/bloc.dart';
import 'package:crypto_nas/core/utils/prefs_operator.dart';
import 'package:crypto_nas/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:crypto_nas/features/feature_home/presentation/models/language.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

const languagePrefsKey = 'languagePrefs';
PrefsOperator prefsOperator = locator();

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
    on<GetLanguage>(onGetLanguage);
  }

  onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    prefsOperator.saveSelectedLanguage(
        languagePrefsKey, event.selectedLanguage.value.languageCode);
    emit(state.copyWith(newSelectedLanguage: event.selectedLanguage));
  }

  // # 2
  onGetLanguage(GetLanguage event, Emitter<LanguageState> emit) async {
    final selectedLanguage =
        await prefsOperator.getSelectedLanguage(languagePrefsKey);

    emit(
      state.copyWith(
        newSelectedLanguage: selectedLanguage != ''
            ? Language.values
                .where((item) => item.value.languageCode == selectedLanguage)
                .first
            : Language.english,
      ),
    );
  }
}
