import 'package:json_annotation/json_annotation.dart';

part 'local_login_request_body.g.dart';

@JsonSerializable()
class LocalLoginRequestBody {
  LocalLoginRequestBody({
    required this.email,
    required this.password,
    required this.keepLoggedIn,
  });

  final String email;
  final String password;
  final bool keepLoggedIn;

  Map<String, dynamic> toJson() => _$LocalLoginRequestBodyToJson(this);
}
