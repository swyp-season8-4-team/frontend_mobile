import 'package:flutter/material.dart';

class CustomLabelTag extends StatelessWidget {
  const CustomLabelTag({
    required this.label,
    required this.backgroundColor,
    required this.color,
    super.key,
  });

  final String label;
  final Color backgroundColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: backgroundColor,
      ),
      child: Text(label, style: textTheme.labelSmall?.copyWith(color: color)),
    );
  }
}
