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
}
