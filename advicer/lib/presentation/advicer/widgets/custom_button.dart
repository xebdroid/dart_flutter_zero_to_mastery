import 'package:advicer/application/advicer/advicer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  const CustomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
      onTap: () => BlocProvider.of<AdvicerBloc>(context).add(AdvicerRequestedEvent()),
      child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeData.colorScheme.secondary,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Text(
                'Get Advice',
                style: themeData.textTheme.titleLarge,
              ),
            ),
          )),
    );
  }
}
