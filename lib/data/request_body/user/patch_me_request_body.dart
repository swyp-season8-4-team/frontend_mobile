import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/patch_me_request_body.g.dart';

@JsonSerializable()
class PatchMeRequestBody {
  PatchMeRequestBody({
    required this.nickname,
    required this.preferences,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.mbti,
  });

  final String? nickname;
  final List<int>? preferences;
  final String? name;
  final String? phoneNumber;
  final String? address;
  final String? gender;
  final String? mbti;

  Map<String, dynamic> toJson() => _$PatchMeRequestBodyToJson(this);
}
