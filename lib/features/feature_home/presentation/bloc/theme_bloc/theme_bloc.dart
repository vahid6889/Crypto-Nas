import 'package:crypto_nas/core/config/my_theme.dart';
import 'package:crypto_nas/core/utils/prefs_operator.dart';
import 'package:crypto_nas/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_event.dart';

PrefsOperator prefsOperator = locator();

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()) {
    //when app is started
    on<ThemeSetInitialEvent>((event, emit) async {
      final bool hasDarkTheme = await isDark();
      if (hasDarkTheme) {
        emit(MyThemes.lightTheme);
      } else {
        emit(MyThemes.darkTheme);
      }
    });

    //while switch is clicked
    on<ThemeSwitchEvent>((event, emit) {
      final isDark = state == MyThemes.darkTheme;
      emit(isDark ? MyThemes.lightTheme : MyThemes.darkTheme);
      setTheme(isDark);
    });
  }
}

Future<bool> isDark() async {
  var darkStatus =
      await prefsOperator.getSelectedTheme("is_dark").then((value) => value);
  return darkStatus;
}

Future<void> setTheme(bool isDark) async {
  prefsOperator.saveSelectedTheme("is_dark", isDark);
}
