import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/post_sign_up_request_body.g.dart';

@JsonSerializable()
class PostSignUpRequestBody {
  PostSignUpRequestBody({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.nickname,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.preferenceIds,
    required this.role,
  });

  final String email;
  final String password;
  final String confirmPassword;
  final String nickname;
  final String? name;
  final String? phoneNumber;
  final String? address;
  final String? gender;
  final List<int>? preferenceIds;
  final String? role;

  Map<String, dynamic> toJson() => _$PostSignUpRequestBodyToJson(this);
}
