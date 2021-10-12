import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class WidgetList extends StatefulWidget {
  const WidgetList({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

enum RadioState { on, off }

class _State extends State<WidgetList> {
  late TextEditingController _textController;
  String _inputText = "";
  RadioState? _group = RadioState.on;
  double _sliderValue = 0;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(_inputText),
        ),
        Center(
          child: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Editar text',
            ),
            onChanged: (text) {
              setState(() {
                // Tambien puede usarte _textController.text
                _inputText = text.isEmpty ? "Vacío" : text;
              });
            },
          ),
        ),
        const Spacer(),
        Center(
          child: Text(
              "Estado: ${_group == RadioState.on ? 'Encendido' : 'Apagado'}"),
        ),
        ListTile(
          title: const Text('Encendido'),
          leading: Radio<RadioState>(
            value: RadioState.on,
            groupValue: _group,
            onChanged: (RadioState? value) {
              setState(() {
                _group = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Apagado'),
          leading: Radio<RadioState>(
            value: RadioState.off,
            groupValue: _group,
            onChanged: (RadioState? value) {
              setState(() {
                _group = value;
              });
            },
          ),
        ),
        const Spacer(),
        Center(
          child: Text("Valor seleccionado: ${_sliderValue.toInt()}"),
        ),
        Slider(
          value: _sliderValue,
          min: 0,
          max: 8,
          onChanged: (newValue) {
            setState(() {
              _sliderValue = newValue;
            });
          },
          divisions: 8,
          label: "${_sliderValue.toInt()}",
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Volver')),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
