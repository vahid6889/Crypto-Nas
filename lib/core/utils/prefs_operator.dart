import 'package:crypto_nas/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsOperator {
  late SharedPreferences sharedPreferences;
  PrefsOperator() {
    sharedPreferences = locator<SharedPreferences>();
  }

  saveSelectedLanguage(String langaugeKey, String langaugeCode) async {
    sharedPreferences.setString(langaugeKey, langaugeCode);
  }

  Future<String> getSelectedLanguage(String langaugeKey) async {
    final status = sharedPreferences.getString(langaugeKey);
    if (status == null) {
      return '';
    }
    return status;
  }

  saveSelectedTheme(String themeKey, bool themeStatus) async {
    sharedPreferences.setBool(themeKey, themeStatus);
  }

  Future<bool> getSelectedTheme(String themeKey) async {
    final status = sharedPreferences.getBool(themeKey);
    if (status == null) {
      return true;
    }
    return status;
  }

  saveUserToken(String tokenKey, String tokenValue) async {
    sharedPreferences.setString(tokenKey, tokenValue);
  }

  setLoggedIn(String loggedKey, bool loggedStatus) async {
    sharedPreferences.setBool(loggedKey, loggedStatus);
  }

  Future<bool> getLoggedIn(String loggedKey) async {
    final status = sharedPreferences.getBool(loggedKey);
    if (status == null) {
      return false;
    }
    return status;
  }

  saveUserProfile(List<String> userProfile) async {
    sharedPreferences.setStringList('user_profile', userProfile);
  }

  Future<List<String>> getUserProfile() async {
    final status = sharedPreferences.getStringList('user_profile');
    if (status == null) {
      return [];
    }
    return status;
  }

  Future<void> logout() async {
    sharedPreferences.remove("LoggedIn");
    sharedPreferences.remove("user_token");
  }

  Future<void> destroy() async {
    sharedPreferences.clear();
  }
}
