import 'package:frontend_mobile/core/resource/enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/email_verification_request_request_body.g.dart';

@JsonSerializable()
class EmailVerificationRequestRequestBody {
  EmailVerificationRequestRequestBody({
    required this.email,
    required this.purpose,
  });

  final String email;
  final String purpose;

  Map<String, dynamic> toJson() =>
      _$EmailVerificationRequestRequestBodyToJson(this);
}
