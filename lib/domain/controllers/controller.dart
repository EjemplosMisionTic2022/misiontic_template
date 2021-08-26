import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/theme_management.dart';

class ThemeController extends GetxController {
  // Using Rx<> for custom class reactivity
  var _isDarkMode = RxBool(false);

  // Setters
  set darkMode(bool mode) {
    _isDarkMode.value = mode;
  }

  // Reactive Getters
  RxBool get reactiveDarkMode => _isDarkMode;

  // Getters
  bool get darkMode => _isDarkMode.value;
}
