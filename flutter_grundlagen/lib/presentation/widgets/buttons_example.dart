import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/presentation/widgets/custom_button.dart';

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            print('Icon button pressed!');
          },
          icon: const Icon(Icons.home, color: Colors.white),
        ),
        const SizedBox(height: 30),
        TextButton(
            onPressed: () {
              print('Text button pressed!');
            },
            child: Container(
                color: Colors.grey,
                child: const Text(
                  'Text Button',
                  style: TextStyle(color: Colors.white),
                ))),
        const SizedBox(height: 30),
        CustomButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/screen2');
          },
          text: 'go to screen 2',
          // Ausrufezeichen bedeutet, dass man definiert, dass der Wert nie null sein wird
          buttonColor: Colors.blue[200]!,
        ),
        const SizedBox(height: 30),
        CustomButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/screen1');
          },
          text: 'go to screen 1',
          // Ausrufezeichen bedeutet, dass man definiert, dass der Wert nie null sein wird
          buttonColor: Colors.green[200]!,
        ),
      ],
    );
  }
}
