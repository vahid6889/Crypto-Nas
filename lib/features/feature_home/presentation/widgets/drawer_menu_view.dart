import 'package:crypto_nas/core/utils/prefs_operator.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:crypto_nas/features/feature_home/presentation/models/language.dart';
import 'package:crypto_nas/core/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:crypto_nas/locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

PrefsOperator prefsOperator = locator();

class DrawerMenuView extends StatefulWidget {
  const DrawerMenuView({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<DrawerMenuView> createState() => _DrawerMenuViewState();
}

class _DrawerMenuViewState extends State<DrawerMenuView> {
  String? dropdownValueDefualt;
  final List<String> _dropdownValues = [
    Language.values[0].text,
    Language.values[1].text,
  ];

  @override
  void initState() {
    super.initState();
    final getLanguage = prefsOperator.getSelectedLanguage('languagePrefs');
    getLanguage.then(
      (value) {
        if (value != '') {
          dropdownValueDefualt =
              value == 'en' ? Language.values[0].text : Language.values[1].text;
        } else {
          dropdownValueDefualt = Language.values[0].text;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: widget.themeData.scaffoldBackgroundColor,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, userProfileState) {
              return UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: widget.themeData.primaryColor),
                accountName: Text(
                  userProfileState.userProfile.last,
                  style: const TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  userProfileState.userProfile.first,
                  style: const TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: RandomAvatar(DateTime.now().toIso8601String()),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.list_alt,
              color: widget.themeData.highlightColor,
            ),
            title: Row(
              children: [
                Text(
                  AppLocalizations.of(context).orders,
                  style: widget.themeData.textTheme.bodySmall,
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: widget.themeData.highlightColor,
            ),
            title: Text(
              AppLocalizations.of(context).personalData,
              style: widget.themeData.textTheme.bodySmall,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: widget.themeData.highlightColor,
            ),
            title: Text(
              AppLocalizations.of(context).settings,
              style: widget.themeData.textTheme.bodySmall,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            focusColor: widget.themeData.scaffoldBackgroundColor,
            leading: Icon(
              Icons.language,
              color: widget.themeData.highlightColor,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).language,
                  style: widget.themeData.textTheme.bodySmall,
                ),
                SizedBox(
                  width: 120,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: widget.themeData.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.2,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: BlocBuilder<LanguageBloc, LanguageState>(
                        builder: (context, languageData) {
                          return DropdownButton(
                            dropdownColor:
                                widget.themeData.scaffoldBackgroundColor,
                            items: _dropdownValues
                                .map(
                                  (value) => DropdownMenuItem(
                                    alignment: Alignment.centerLeft,
                                    value: value,
                                    child: Text(
                                      value == 'English'
                                          ? '${Language.values[0].flag} $value'
                                          : '${Language.values[1].flag} $value',
                                      style:
                                          widget.themeData.textTheme.bodySmall,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              int indexOfSelectedLanguage =
                                  _dropdownValues.indexOf(value!);
                              BlocProvider.of<LanguageBloc>(context).add(
                                ChangeLanguage(
                                  selectedLanguage:
                                      Language.values[indexOfSelectedLanguage],
                                ),
                              );

                              dropdownValueDefualt = value;
                            },
                            isExpanded: true,
                            value: languageData.selectedLanguage.text,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.local_police_outlined,
              color: widget.themeData.highlightColor,
            ),
            title: Text(
              AppLocalizations.of(context).privacyPolicy,
              style: widget.themeData.textTheme.bodySmall,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          AboutListTile(
            // <-- SEE HERE
            icon: Icon(
              Icons.info,
              color: widget.themeData.highlightColor,
            ),
            applicationIcon: const Icon(
              Icons.local_play,
            ),
            applicationName: AppLocalizations.of(context).exchangeCn,
            applicationVersion: '1.0.25',
            applicationLegalese: '© 2019 Company',
            aboutBoxChildren: const [
              ///Content goes here...
            ],
            child: Text(
              AppLocalizations.of(context).aboutApp,
              style: widget.themeData.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
