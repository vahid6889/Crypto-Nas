import 'package:crypto_nas/core/config/my_theme.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({super.key});
  static int page = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: BlocBuilder<ThemeBloc, ThemeData>(
                    builder: (context, themeData) {
                      return Lottie.asset(
                        themeData == MyThemes.darkTheme
                            ? 'assets/bitcointouch-dark.json'
                            : 'assets/bitcointouch.json',
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
