import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/presentation/widgets/custom_button.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Screen 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              buttonColor: Colors.yellow,
              text: 'Navigate back',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonColor: Colors.yellow,
              text: 'go to screen 1',
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/screen1');
              },
            ),
          ],
        ),
      ),
    );
  }
}
