import 'package:flutter/material.dart';

class LifeCard extends StatelessWidget {
  final Widget child;

  const LifeCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF16181C),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white10),
      ),
      child: child,
    );
  }
}
