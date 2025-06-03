import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/password_reset_header.g.dart';

@JsonSerializable()
class PasswordResetHeader {
  PasswordResetHeader({required this.emailToken});

  final String emailToken;

  Map<String, dynamic> toJson() => _$PasswordResetHeaderToJson(this);
}
