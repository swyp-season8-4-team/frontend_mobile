import 'package:flutter/material.dart';

class TextLineBreak extends StatelessWidget {
  const TextLineBreak({required this.text, required this.style, super.key});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        children:
            text
                .split(' ')
                .map((String word) => Text('$word ', style: style))
                .toList(),
      ),
    );
  }
}
