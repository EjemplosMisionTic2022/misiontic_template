import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:misiontic_template/domain/use_case/controller.dart';
import 'package:misiontic_template/presentation/pages/stateful/index.dart';

class WidgetList extends StatelessWidget {
  final Controller controller;

  WidgetList({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Text(
            'Estos son unos de los widgets sin estado más comunes...',
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              controller.darkMode = !controller.darkMode;
            },
            child: Text('Elevated Button')),
        OutlinedButton(
            onPressed: () {
              controller.darkMode = !controller.darkMode;
            },
            child: Text('Outlined Button')),
        TextButton(
            onPressed: () {
              controller.darkMode = !controller.darkMode;
            },
            child: Text('Text Button')),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
              onPressed: () {
                Get.to(() => StatefulList());
              },
              child: Text('Ver Widgets con Estado')),
        ),
      ],
    );
  }
}
