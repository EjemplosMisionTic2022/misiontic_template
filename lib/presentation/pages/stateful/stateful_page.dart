import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';
import 'package:misiontic_template/presentation/pages/stateful/screens/stateful_screen.dart';
import 'package:misiontic_template/presentation/widgets/appbar.dart';

class StatefulList extends StatelessWidget {
  final ThemeController controller = Get.find();
  StatefulList({Key? key}) : super(key: key);

  // We create a Scaffold that is used for all the content pages
  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        controller: controller,
        tile: const Text("Stateful Widgets"),
        context: context,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: WidgetList(),
        ),
      ),
    );
  }
}
