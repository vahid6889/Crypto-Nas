import 'package:crypto_nas/core/config/my_theme.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitcher extends StatelessWidget {
  final Color? colorIconAction;
  const ThemeSwitcher({super.key, this.colorIconAction});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<ThemeBloc>(context).add(ThemeSwitchEvent());
      },
      icon: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, themeData) {
          return Icon(
            themeData == MyThemes.darkTheme
                ? Icons.wb_sunny
                : Icons.nights_stay,
            color: colorIconAction,
          );
        },
      ),
    );
  }
}
