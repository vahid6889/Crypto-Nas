import 'package:crypto_nas/core/presentation/ui/main_wrapper.dart';
import 'package:crypto_nas/core/utils/prefs_operator.dart';
import 'package:crypto_nas/features/feature_profile/domain/entities/user_entity.dart';
import 'package:crypto_nas/features/feature_profile/presentation/bloc/form_bloc/form_bloc.dart';
import 'package:crypto_nas/features/feature_profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:crypto_nas/features/feature_profile/presentation/bloc/profile_bloc/register_status.dart';
import 'package:crypto_nas/features/feature_profile/presentation/screens/login_screen.dart';
import 'package:crypto_nas/features/feature_profile/presentation/widgets/sign_up_btn.dart';
import 'package:crypto_nas/locator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

const userTokenPrefsKey = 'user_token';
const userNamePrefsKey = 'user_name_profile';
const userEmailPrefsKey = 'user_email_profile';
const userLoggedIn = 'LoggedIn';

PrefsOperator prefsOperator = locator();

class SignUpMobileView extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignUpMobileView({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final _formKey = GlobalKey<FormState>();
  final List<String> userProfile = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Lottie.asset(
            'assets/waveloop.json',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).signUp,
                  style: themeData.textTheme.headlineLarge,
                ),
                Text(
                  AppLocalizations.of(context).createAccount,
                  style: themeData.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  style: themeData.textTheme.displaySmall,
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: themeData.dividerColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: themeData.dividerColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    errorStyle: themeData.textTheme.displaySmall,
                    hintStyle: themeData.textTheme.displaySmall,
                    prefixIconColor: themeData.focusColor,
                    prefixIcon: const Icon(Icons.person),
                    hintText: AppLocalizations.of(context).userName,
                  ),

                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context).validateUserName;
                    } else if (value.length < 4) {
                      return AppLocalizations.of(context)
                          .validateUserNameMinimum;
                    } else if (value.length > 13) {
                      return AppLocalizations.of(context)
                          .validateUserNameMaximum;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  style: themeData.textTheme.displaySmall,
                  controller: emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: themeData.dividerColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: themeData.dividerColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    errorStyle: themeData.textTheme.displaySmall,
                    hintStyle: themeData.textTheme.displaySmall,
                    prefixIconColor: themeData.focusColor,
                    prefixIcon: const Icon(Icons.email_rounded),
                    hintText: AppLocalizations.of(context).gmail,
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context).validateEmailEnter;
                    } else if (!value.endsWith('@gmail.com') ||
                        !EmailValidator.validate(value)) {
                      return AppLocalizations.of(context).validateEmailValid;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                BlocBuilder<FormBloc, bool>(
                  builder: (context, obscureState) {
                    return TextFormField(
                      style: themeData.textTheme.displaySmall,
                      controller: passwordController,
                      obscureText: obscureState,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: themeData.dividerColor),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: themeData.dividerColor),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        errorStyle: themeData.textTheme.displaySmall,
                        hintStyle: themeData.textTheme.displaySmall,
                        prefixIconColor: themeData.focusColor,
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureState
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: themeData.focusColor,
                          ),
                          onPressed: () {
                            BlocProvider.of<FormBloc>(context)
                                .add(ObscureTextSwitchEvent(!obscureState));
                          },
                        ),
                        hintText: AppLocalizations.of(context).password,
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context).validatePassword;
                        } else if (value.length < 7) {
                          return AppLocalizations.of(context)
                              .validatePasswordMinimum;
                        } else if (value.length > 13) {
                          return AppLocalizations.of(context)
                              .validatePasswordMaximum;
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  AppLocalizations.of(context).privacyNotice,
                  style: GoogleFonts.ubuntu(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (previous, current) {
                    if (previous.registerStatus == current.registerStatus) {
                      return false;
                    }
                    return true;
                  },
                  builder: (context, state) {
                    if (state.registerStatus is RegisterLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state.registerStatus is RegisterCompleted) {
                      /// cast data
                      final RegisterCompleted registerCompleted =
                          state.registerStatus as RegisterCompleted;

                      final UserEntity? profileEntity =
                          registerCompleted.profileEntity;

                      userProfile.addAll([
                        profileEntity!.data!.user!.email!,
                        profileEntity.data!.user!.userName!
                      ]);
                      prefsOperator.saveUserProfile(userProfile);

                      savedLogin(profileEntity.data!.token!);
                      WidgetsBinding.instance.addPostFrameCallback(
                        (timeStamp) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainWrapper(),
                          ),
                          ModalRoute.withName('/'),
                        ),
                      );
                      SignUpBtn(
                        nameController: nameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        formKey: _formKey,
                      );
                    }
                    if (state.registerStatus is RegisterError) {
                      final RegisterError registerError =
                          state.registerStatus as RegisterError;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SignUpBtn(
                            nameController: nameController,
                            emailController: emailController,
                            passwordController: passwordController,
                            formKey: _formKey,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.error,
                                color: Colors.redAccent,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                registerError.message,
                                style: GoogleFonts.ubuntu(
                                  color: Colors.redAccent,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return SignUpBtn(
                      nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      formKey: _formKey,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context).alreadyHaveAnAccount,
            style: themeData.textTheme.displaySmall,
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 5),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FloatingActionButton.extended(
                    elevation: 0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 250),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 250),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const LoginScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            animation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.linear,
                            );
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 1),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    backgroundColor: themeData.scaffoldBackgroundColor,
                    label: Text(
                      AppLocalizations.of(context).login,
                      style: const TextStyle(color: Colors.blue),
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Future<void> savedLogin(String userToken) async {
    prefsOperator.saveUserToken(userTokenPrefsKey, userToken);
    prefsOperator.setLoggedIn(userLoggedIn, true);
  }
}
