import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/reject_mate_member_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class RejectMateMemberRequestBody {
  RejectMateMemberRequestBody({
    required this.creatorUserUuid,
    required this.rejectUserUuid,
  });

  final String creatorUserUuid;
  final String rejectUserUuid;

  Map<String, dynamic> toJson() => _$RejectMateMemberRequestBodyToJson(this);
}
