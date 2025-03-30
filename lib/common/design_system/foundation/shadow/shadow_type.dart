import 'package:flutter/material.dart';

class ShadowType {
  ShadowType({
    required this.dx,
    required this.dy,
    required this.blurRadius,
    required this.spreadRadius,
    required this.color,
  });

  final double dx;
  final double dy;
  final double blurRadius;
  final double spreadRadius;
  final Color color;
}
