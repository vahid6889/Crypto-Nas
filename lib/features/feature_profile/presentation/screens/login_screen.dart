import 'package:crypto_nas/core/presentation/widgets/theme_switcher.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:crypto_nas/features/feature_home/presentation/models/language.dart';
import 'package:crypto_nas/features/feature_profile/presentation/widgets/login_desktop_view.dart';
import 'package:crypto_nas/features/feature_profile/presentation/widgets/login_mobile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login_screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String languageCode = Localizations.localeOf(context).languageCode;
    var themeData = Theme.of(context);
    return Directionality(
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
                        : Language.english),
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
        ),
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return LoginDesktopView(
                emailController: emailController,
                passwordController: passwordController,
              );
            } else {
              return LoginMobileView(
                emailController: emailController,
                passwordController: passwordController,
              );
            }
          },
        ),
      ),
    );
  }
}
