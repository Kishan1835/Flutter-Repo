import 'package:flutter/material.dart';
// Importing from the gradient_container file
//that contains Gradientcontainer class
import 'package:dice_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          // Option 2
          // colors: [
          //   Color.fromARGB(255, 25, 92, 225),
          //   Color.fromARGB(255, 164, 100, 9)
          // ],
          // Option 2
          Color.fromARGB(255, 112, 48, 224),
          Color.fromARGB(255, 227, 92, 137),
        ),
      ),
    ),
  );
}
