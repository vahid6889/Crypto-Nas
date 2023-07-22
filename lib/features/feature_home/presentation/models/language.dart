import 'dart:ui';

// import '../../../../gen/assets.gen.dart';

enum Language {
  english(
    Locale('en', 'US'),
    '\u{1F1FA}\u{1F1F2}',
    'English',
  ),
  farsi(
    Locale('fa', 'FA'),
    '\u{1F1EE}\u{1F1F7}',
    'Farsi',
  );

  /// Add another languages support here
  const Language(this.value, this.flag, this.text);

  final Locale value;
  final String flag;
  final String text; // Optional: this properties used for ListTile details
}
