import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/post_sign_up_with_profile_params.freezed.dart';

@freezed
class PostSignUpWithProfileParams with _$PostSignUpWithProfileParams {
  const factory PostSignUpWithProfileParams({
    required String email,
    required String password,
    required String confirmPassword,
    required String nickname,
    required String emailToken,
    String? name,
    String? phoneNumber,
    String? address,
    String? gender,
    List<int>? preferenceIds,
    String? role,
    MultipartFile? profileImage,
  }) = _PostSignUpWithProfileParams;
}
