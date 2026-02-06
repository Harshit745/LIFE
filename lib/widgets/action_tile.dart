import 'package:flutter/material.dart';
import '../ui/text_styles.dart';

class ActionTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ActionTile({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF16181C),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Text(label, style: LifeText.button),
              const Spacer(),
              const Icon(Icons.chevron_right, color: Colors.white38),
            ],
          ),
        ),
      ),
    );
  }
}
