import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/post_sign_up_with_profile_request_body.g.dart';

@JsonSerializable()
class PostSignUpWithProfileRequestBody {
  PostSignUpWithProfileRequestBody({
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
    this.profileImage,
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
  @JsonKey(includeFromJson: false, includeToJson: false)
  final MultipartFile? profileImage;

  Map<String, dynamic> toJson() =>
      _$PostSignUpWithProfileRequestBodyToJson(this);
}
