import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/ban_mate_member_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class BanMateMemberRequestBody {
  BanMateMemberRequestBody({
    required this.creatorUserUuid,
    required this.banUserUuid,
  });

  final String creatorUserUuid;
  final String banUserUuid;

  Map<String, dynamic> toJson() => _$BanMateMemberRequestBodyToJson(this);
}
