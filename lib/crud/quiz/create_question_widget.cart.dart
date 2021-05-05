import 'package:flutter/material.dart';

class CreateAwanserWidget extends StatelessWidget {
  final bool isRight;
  final String title;
  final String hintText;
  final TextEditingController controller;

  CreateAwanserWidget({
    required this.title,
    this.isRight = false,
    required this.hintText,
    required this.controller,
  });

  CreateAwanserWidget.isRight({required String title, required this.controller})
      : this.title = title,
        this.isRight = true,
        this.hintText = "Resposta Correta";

  CreateAwanserWidget.isWrong({required String title, required this.controller})
      : this.title = title,
        this.isRight = false,
        this.hintText = "Resposta Errada";


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: isRight ? Colors.blue.shade100 : Colors.red.shade100,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          prefixIcon: Icon(isRight ? Icons.check: Icons.close),
          labelText: title,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }
}
