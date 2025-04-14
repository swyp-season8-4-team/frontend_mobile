import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/post_sign_up_header.g.dart';

@JsonSerializable()
class PostSignUpHeader {
  PostSignUpHeader({required this.emailToken});

  final String emailToken;

  Map<String, dynamic> toJson() => _$PostSignUpHeaderToJson(this);
}
