import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';
import 'package:misiontic_template/presentation/pages/stateful/stateful_page.dart';

class WidgetList extends StatelessWidget {
  final ThemeController controller;

  const WidgetList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Center(
          child: Text(
            'Estos son unos de los widgets sin estado más comunes...',
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              controller.darkMode = !controller.darkMode;
            },
            child: const Text('Elevated Button')),
        OutlinedButton(
            onPressed: () {
              controller.darkMode = !controller.darkMode;
            },
            child: const Text('Outlined Button')),
        TextButton(
            onPressed: () {
              controller.darkMode = !controller.darkMode;
            },
            child: const Text('Text Button')),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
              onPressed: () {
                Get.to(() => StatefulList());
              },
              child: const Text('Ver Widgets con Estado')),
        ),
      ],
    );
  }
}
