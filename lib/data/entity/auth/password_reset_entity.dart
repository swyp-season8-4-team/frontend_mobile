import 'package:json_annotation/json_annotation.dart';

part 'generated/password_reset_entity.g.dart';

@JsonSerializable()
class PasswordResetEntity {
  const PasswordResetEntity({this.success, this.message});

  factory PasswordResetEntity.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetEntityFromJson(json);

  final bool? success;
  final String? message;
}
