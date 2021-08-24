import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/data/repositories/shared_preferences.dart';

class ThemeManager {
  final _sharedPreferences = LocalPreferences();

  Future<void> changeTheme({required bool isDarkMode}) async {
    // Before change the theme we store the preference
    print("Change theme to $isDarkMode");
    await _sharedPreferences.storeData<bool>('DarkTheme', isDarkMode);
    // We change the subject accordingly
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  // If there isn't any stored preference we set it to the current mode
  Future<bool> get initializeTheme async {
    bool temp = await _sharedPreferences.retrieveData<bool>('DarkTheme') ??
        Get.isDarkMode;
    //print("Got stored variable $storedTheme");
    Get.changeThemeMode(temp ? ThemeMode.dark : ThemeMode.light);
    return temp;
  }
}
