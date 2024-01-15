import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/presentation/widgets/custom_button.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Screen 1'),
        centerTitle: true,
      ),
      body: Center(
          child: CustomButton(
        buttonColor: Colors.green,
        text: 'Navigate back',
        onPressed: () {
          Navigator.of(context).pop();
        },
      )),
    );
  }
}
