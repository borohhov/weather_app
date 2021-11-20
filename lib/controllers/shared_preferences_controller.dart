import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  late SharedPreferences prefs;

  Future<SharedPreferences> getPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs;
  }

  void setString(String key, String value) async {
    (await getPrefs()).setString(key, value);
  }

  dynamic getString(String key) async {
    (await getPrefs()).getString(key);
  }
}
