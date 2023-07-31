import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out Y questions correctly'),
            const SizedBox(
              height: 35,
            ),
            const Text('List of answer nad questions...'),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Restart quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
