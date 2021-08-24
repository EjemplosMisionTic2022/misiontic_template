import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/controllers/controller.dart';
import 'package:misiontic_template/presentation/pages/stateless/index.dart';
import 'package:misiontic_template/presentation/theme/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Dependency injection: setting up state management
  late final ThemeController controller = Get.put(ThemeController());
  bool isLoaded = false;

  Future<void> initializeTheme() async {
    await controller.initializeTheme();
    setState(() => isLoaded = true);
  }

  @override
  void initState() {
    initializeTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? CircularProgressIndicator()
        : GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyTheme.ligthTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: ThemeMode.system,
            home: StatelessList(),
          );
  }
}
