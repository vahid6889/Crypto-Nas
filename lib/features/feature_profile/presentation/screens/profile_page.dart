import 'package:crypto_nas/core/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:crypto_nas/core/utils/prefs_operator.dart';
import 'package:crypto_nas/features/feature_profile/presentation/screens/sign_up_screen.dart';
import 'package:crypto_nas/features/feature_profile/presentation/utils/profile_list_model.dart';
import 'package:crypto_nas/features/feature_profile/presentation/widgets/profile_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:crypto_nas/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_avatar/random_avatar.dart';

PrefsOperator prefsOperator = locator();

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  static int page = 2;

  @override
  Widget build(BuildContext context) {
    final List<ProfileListModel> profileList = [
      ProfileListModel(
        iconData: Icons.person,
        title: AppLocalizations.of(context).personalData,
        onTap: () {},
      ),
      ProfileListModel(
        iconData: Icons.list_alt,
        title: AppLocalizations.of(context).orders,
        onTap: () {},
      ),
      ProfileListModel(
        iconData: Icons.settings,
        title: AppLocalizations.of(context).profileSetting,
        onTap: () {},
      ),
      ProfileListModel(
        iconData: Icons.verified_user,
        title: AppLocalizations.of(context).authentication,
        onTap: () {},
      ),
      ProfileListModel(
        iconData: Icons.support_agent,
        title: AppLocalizations.of(context).faqs,
        onTap: () {},
      ),
      ProfileListModel(
        iconData: Icons.book,
        title: AppLocalizations.of(context).ourHandbook,
        onTap: () {},
      ),
      ProfileListModel(
        iconData: Icons.supervised_user_circle_sharp,
        title: AppLocalizations.of(context).community,
        onTap: () {},
      ),
      ProfileListModel(
        iconData: Icons.exit_to_app,
        title: AppLocalizations.of(context).logout,
        onTap: () {
          prefsOperator.logout();
          Navigator.pushNamedAndRemoveUntil(
            context,
            SignUpScreen.routeName,
            ModalRoute.withName(SignUpScreen.routeName),
          );
        },
      ),
    ];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: height * 0.10),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: RandomAvatar(DateTime.now().toIso8601String()),
                  ),
                ),
                SizedBox(width: width * 0.05),
                BlocBuilder<UserProfileBloc, UserProfileState>(
                  builder: (context, userProfileState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userProfileState.userProfile.last,
                          style: themeData.textTheme.bodySmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              userProfileState.userProfile.first,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: profileList.length,
          itemBuilder: (context, index) {
            return ProfileListTile(
                iconData: profileList[index].iconData,
                title: profileList[index].title,
                onTap: profileList[index].onTap,
                isLast: (index == profileList.length - 1) ? true : false);
          },
        ),
        SizedBox(height: height * 0.15),
      ],
    );
  }
}
