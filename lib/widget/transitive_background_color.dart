import 'package:flutter/material.dart';

class TransitiveColorContainer extends StatelessWidget {
  const TransitiveColorContainer({super.key, required this.child, required this.color});
  
  final Widget child;
  final MaterialColor color;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.shade700,
            color.shade500,
            color.shade300,
            color.shade100,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.3, 0.5, 0.7, 1.0],
        ),
      ),
    );
  }
}