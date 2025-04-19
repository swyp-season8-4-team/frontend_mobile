import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/post_sign_up_with_profile_header.g.dart';

@JsonSerializable()
class PostSignUpWithProfileHeader {
  PostSignUpWithProfileHeader({required this.emailToken});

  final String emailToken;

  Map<String, dynamic> toJson() => _$PostSignUpWithProfileHeaderToJson(this);
}
