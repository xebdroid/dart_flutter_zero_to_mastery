import 'package:flutter/material.dart';

class Sun extends StatelessWidget {
  const Sun({super.key});

  @override
  Widget build(BuildContext context) {
    return SunShine(
      radius: 160,
      child: SunShine(
        radius: 120,
        child: SunShine(
          radius: 80,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Color(0xDDFC554F), Color(0xDDFFF79E)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight),
            ),
          ),
        ),
      ),
    );
  }
}

class SunShine extends StatelessWidget {
  final double radius;
  final Widget child;

  const SunShine({super.key, required this.radius, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.1),
      ),
      child: Center(child: child),
    );
  }
}
