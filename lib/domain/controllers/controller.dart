import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/theme_management.dart';

class ThemeController extends GetxController {
  // Using Rx<> for custom class reactivity
  var _isDarkMode = false.obs;
  ThemeManager themeManager = new ThemeManager();

  // Setters
  set darkMode(bool mode) {
    _isDarkMode.value = mode;
    themeManager.changeTheme(isDarkMode: mode);
  }

  // Reactive Getters
  //RxBool get reactiveDarkMode => _isDarkMode;

  bool get darkMode => _isDarkMode.value;

  // Getters
  void initializeTheme() async {
    _isDarkMode.value = await themeManager.initializeTheme;
  }
}
