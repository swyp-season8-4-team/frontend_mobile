import 'package:frontend_mobile/core/resource/enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/email_verify_request_body.g.dart';

@JsonSerializable()
class EmailVerifyRequestBody {
  EmailVerifyRequestBody({
    required this.email,
    required this.code,
    required this.purpose,
  });

  final String email;
  final String code;
  final String purpose;

  Map<String, dynamic> toJson() => _$EmailVerifyRequestBodyToJson(this);
}
