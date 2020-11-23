import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static SharedPreferences prefInstance;

  SharedPref() {
    SharedPreferences.getInstance().then((pref) {
      prefInstance = pref;
    });
  }

}