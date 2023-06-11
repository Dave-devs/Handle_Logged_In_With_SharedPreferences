import 'package:shared_preferences/shared_preferences.dart';
import '../values/constants.dart';

class StorageService{
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }
  bool getDeviceFirstOpen() {
    //return either true or false
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }
  bool getIsLoggedIn() {
    //checks if user logged in or not
    return _prefs.getString(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) == null ? false : true;
  }

}