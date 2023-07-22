import 'package:crypto_nas/core/params/register_params.dart';
import 'package:crypto_nas/features/feature_profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBtn extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  const SignUpBtn({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (formKey.currentState!.validate()) {
            /// create params for api call
            final RegisterParams registerParams = RegisterParams(
              nameController.text,
              emailController.text,
              passwordController.text,
              passwordController.text,
            );

            BlocProvider.of<ProfileBloc>(context).add(
              LoadRegisterEvent(registerParams),
            );
          }
        },
        child: Text(AppLocalizations.of(context).signUp),
      ),
    );
  }
}
