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

  Future<String>? getString(String key) async {
    return Future.value((await getPrefs()).getString(key));
  }


}
