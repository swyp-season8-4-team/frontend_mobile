import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/email_verify_entity.g.dart';

@JsonSerializable()
class EmailVerifyEntity {
  EmailVerifyEntity({this.verificationToken = '', this.verified = false});

  factory EmailVerifyEntity.fromJson(Map<String, dynamic> json) =>
      _$EmailVerifyEntityFromJson(json);

  final String verificationToken;
  final bool verified;
}
