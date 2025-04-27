import 'package:flutter/material.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:intl/intl.dart';

extension StringValidationExt on String {
  bool get isEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  bool get isPasswordValid => RegExp(
    r'^(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%^&*()_+{}\[\]:;<>,.?~\\/-]).{8,}$',
  ).hasMatch(this);

  String toDate() {
    final DateTime parsedDate = DateTime.parse(this);
    return DateFormat('yyyy.MM.dd').format(parsedDate);
  }

  String toTime() {
    final DateTime parsedDate = DateTime.parse(this);
    return DateFormat('yyyy.MM.dd HH:mm').format(parsedDate);
  }
}

extension StoreListIconColorExt on StoreListIconColor {
  Color get color {
    return switch (id) {
      1 => const Color(0xFFFFC803),
      2 => const Color(0xFFFF8803),
      3 => const Color(0xFF05D352),
      4 => const Color(0xFF00C6D8),
      _ => throw Exception(),
    };
  }
}
