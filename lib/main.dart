import 'package:crypto_nas/core/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:crypto_nas/core/presentation/ui/main_wrapper.dart';
import 'package:crypto_nas/core/utils/prefs_operator.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/choice_chip_bloc/choice_chip_bloc.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:crypto_nas/features/feature_market/presentation/bloc/market_bloc/market_bloc.dart';
import 'package:crypto_nas/features/feature_profile/presentation/bloc/form_bloc/form_bloc.dart';
import 'package:crypto_nas/features/feature_profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:crypto_nas/features/feature_profile/presentation/screens/login_screen.dart';
import 'package:crypto_nas/features/feature_profile/presentation/screens/sign_up_screen.dart';
import 'package:crypto_nas/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

PrefsOperator prefsOperator = locator();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  /// init locator
  await setup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()..add(ThemeSetInitialEvent())),
        BlocProvider(create: (_) => LanguageBloc()..add(GetLanguage())),
        BlocProvider(
            create: (_) => ChoiceChipBloc()..add(ChoiceChipInitialEvent())),
        BlocProvider(create: (_) => FormBloc()..add(ObscureTextInitialEvent())),
        BlocProvider(
            create: (_) => UserProfileBloc()..add(UserProfileInitialEvent())),
        BlocProvider(
            create: (_) => locator<HomeBloc>()..add(LoadTopMarketCapEvent())),
        BlocProvider(create: (_) => locator<MarketBloc>()),
        BlocProvider(create: (_) => locator<ProfileBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, themeData) {
        return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, languageData) {
          return MaterialApp(
            theme: themeData,
            debugShowCheckedModeBanner: false,
            title: "Exchange CN",
            home: FutureBuilder<bool>(
              future: prefsOperator.getLoggedIn("LoggedIn"),
              builder: (context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.hasData) {
                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: snapshot.data == true
                        ? MainWrapper()
                        : const SignUpScreen(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            // initialRoute: "/",
            locale: languageData.selectedLanguage.value,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("en", ""),
              Locale("fa", ""),
            ],
            routes: {
              SignUpScreen.routeName: (context) => const SignUpScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
            },
          );
        });
      },
    );
  }
}
