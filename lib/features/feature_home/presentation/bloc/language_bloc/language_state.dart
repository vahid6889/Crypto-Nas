part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final Language selectedLanguage;

  const LanguageState({
    Language? selectedLanguage,
  }) : selectedLanguage = selectedLanguage ?? Language.english;

  LanguageState copyWith({
    Language? newSelectedLanguage,
  }) {
    return LanguageState(
      selectedLanguage: newSelectedLanguage ?? selectedLanguage,
    );
  }

  @override
  List<Object?> get props => [
        selectedLanguage,
      ];
}
