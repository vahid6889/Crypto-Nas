import 'package:crypto_nas/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsOperator {
  late SharedPreferences sharedPreferences;
  PrefsOperator() {
    sharedPreferences = locator<SharedPreferences>();
  }

  saveSelectedLanguage(langaugeKey, langaugeCode) async {
    sharedPreferences.setString(langaugeKey, langaugeCode);
  }

  Future<String> getSelectedLanguage(String langaugeKey) async {
    var status = sharedPreferences.getString(langaugeKey);
    if (status == null) {
      return '';
    }
    return status;
  }

  saveSelectedTheme(themeKey, themeStatus) async {
    sharedPreferences.setBool(themeKey, themeStatus);
  }

  Future<bool> getSelectedTheme(themeKey) async {
    var status = sharedPreferences.getBool(themeKey);
    if (status == null) {
      return true;
    }
    return status;
  }

  saveUserToken(tokenKey, tokenValue) async {
    sharedPreferences.setString(tokenKey, tokenValue);
  }

  setLoggedIn(loggedKey, loggedStatus) async {
    sharedPreferences.setBool(loggedKey, loggedStatus);
  }

  Future<bool> getLoggedIn(String loggedKey) async {
    var status = sharedPreferences.getBool(loggedKey);
    if (status == null) {
      return false;
    }
    return status;
  }

  saveUserProfile(List<String> userProfile) async {
    sharedPreferences.setStringList('user_profile', userProfile);
  }

  Future<List<String>> getUserProfile() async {
    var status = sharedPreferences.getStringList('user_profile');
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
