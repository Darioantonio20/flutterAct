import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Reto1Screen extends StatefulWidget {
  const Reto1Screen({Key? key}) : super(key: key);

  @override
  _Reto1ScreenState createState() => _Reto1ScreenState();
}

class _Reto1ScreenState extends State<Reto1Screen> {
  final TextEditingController _textController = TextEditingController();
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reto 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _textController,
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                });
              },
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: 'Mostrar Texto',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Texto ingresado: $_inputText')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 33, 243, 184)),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white)
        ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const CustomTextField({Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    decoration: const InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 33, 243, 184)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 33, 243, 184)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 33, 243, 184)),
      ),
      labelText: 'Ingresa el textito en la casillita',
      labelStyle: TextStyle(color: Color.fromARGB(255, 33, 243, 184)),
    ),
    style: const TextStyle(color: Color.fromARGB(255, 33, 243, 184)), // Color del texto ingresado
    cursorColor: Color.fromARGB(255, 33, 243, 184), // Color del cursor
  );
}
}
