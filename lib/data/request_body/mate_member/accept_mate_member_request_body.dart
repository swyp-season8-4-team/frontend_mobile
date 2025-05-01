import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/accept_mate_member_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class AcceptMateMemberRequestBody {
  AcceptMateMemberRequestBody({
    required this.creatorUserUuid,
    required this.acceptUserUuid,
  });

  final String creatorUserUuid;
  final String acceptUserUuid;

  Map<String, dynamic> toJson() => _$AcceptMateMemberRequestBodyToJson(this);
}
