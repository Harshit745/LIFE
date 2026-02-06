import 'package:flutter/material.dart';

class ChartLegend extends StatelessWidget {
  const ChartLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _LegendItem(
          color: Colors.blueAccent,
          label: "Reflection Index",
        ),
        SizedBox(height: 8),
        _LegendItem(
          color: Colors.greenAccent,
          label: "Focus",
        ),
        SizedBox(height: 8),
        _LegendItem(
          color: Colors.orangeAccent,
          label: "Energy",
        ),
        SizedBox(height: 8),
        _LegendItem(
          color: Colors.redAccent,
          label: "Distraction",
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
