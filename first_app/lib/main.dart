import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          [
            Color.fromARGB(255, 23, 3, 57),
            Color.fromARGB(255, 81, 5, 95),
          ],
        ),
      ),
    ),
  );
}
