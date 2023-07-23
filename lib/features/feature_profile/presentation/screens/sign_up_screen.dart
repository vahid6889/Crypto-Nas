import 'package:crypto_nas/core/presentation/widgets/theme_switcher.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:crypto_nas/features/feature_home/presentation/models/language.dart';
import 'package:crypto_nas/features/feature_profile/presentation/widgets/sign_up_desktop_view.dart';
import 'package:crypto_nas/features/feature_profile/presentation/widgets/sign_up_mobile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/sign_up_screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String languageCode = Localizations.localeOf(context).languageCode;
    var themeData = Theme.of(context);
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, themeDataState) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarBrightness: themeData.brightness,
            statusBarColor: themeData.scaffoldBackgroundColor,
            systemNavigationBarColor: themeDataState.scaffoldBackgroundColor,
            statusBarIconBrightness: themeDataState == ThemeData.dark()
                ? Brightness.dark
                : Brightness.light,
            systemNavigationBarIconBrightness:
                themeDataState == ThemeData.dark()
                    ? Brightness.dark
                    : Brightness.light,
          ),
          child: Directionality(
            textDirection:
                languageCode == 'fa' ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: themeData.scaffoldBackgroundColor,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    BlocProvider.of<LanguageBloc>(context).add(
                      ChangeLanguage(
                        selectedLanguage: languageCode == 'en'
                            ? Language.farsi
                            : Language.english,
                      ),
                    );
                  },
                  icon: BlocBuilder<LanguageBloc, LanguageState>(
                    builder: (context, languageData) {
                      return Text(
                        languageCode == 'en'
                            ? Language.farsi.flag
                            : Language.english.flag,
                      );
                    },
                  ),
                ),
                actions: [
                  ThemeSwitcher(
                    colorIconAction: themeData.canvasColor,
                  ),
                ],
                titleTextStyle: themeData.textTheme.headlineMedium,
              ),
              resizeToAvoidBottomInset: false,
              body: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return SignUpDesktopView(
                      nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController,
                    );
                  } else {
                    return SignUpMobileView(
                      nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController,
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
