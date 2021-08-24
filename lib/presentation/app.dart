import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controller.dart';
import 'package:misiontic_template/domain/use_case/theme_management.dart';
import 'package:misiontic_template/presentation/pages/stateless/index.dart';
import 'package:misiontic_template/presentation/theme/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Dependency injection: setting up state management
  late final Controller controller = Get.put(Controller());

  // Theme management
  late final ThemeManager manager = ThemeManager();

  void initializeTheme(ThemeManager manager, Controller controller) async {
    controller.darkMode = await manager.storedTheme;
  }

  @override
  void initState() {
    // State management: listening for changes on theme
    ever(controller.reactiveDarkMode, (bool isDarkMode) {
      manager.changeTheme(isDarkMode: isDarkMode);
    });
    initializeTheme(manager, controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.ligthTheme,
      darkTheme: MyTheme.darkTheme,
      home: StatelessList(),
    );
  }
}
