import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/email_verify_model.g.dart';

@JsonSerializable()
class EmailVerifyModel {
  const EmailVerifyModel({
    required this.verificationToken,
    required this.verified,
  });

  factory EmailVerifyModel.fromJson(Map<String, dynamic> json) =>
      _$EmailVerifyModelFromJson(json);

  final String verificationToken;
  final bool verified;
}
