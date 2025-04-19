import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/post_nickname_request_body.g.dart';

@JsonSerializable()
class PostNicknameRequestBody {
  PostNicknameRequestBody({required this.nickname, required this.purpose});

  final String nickname;
  final String purpose;

  Map<String, dynamic> toJson() => _$PostNicknameRequestBodyToJson(this);
}
