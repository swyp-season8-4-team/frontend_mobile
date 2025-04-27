import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/post_mate_reply_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class PostMateReplyRequestBody {
  PostMateReplyRequestBody({
    required this.userUuid,
    required this.content,
    this.parentMateReplyId,
  });

  final String userUuid;
  final String content;
  final int? parentMateReplyId;

  Map<String, dynamic> toJson() => _$PostMateReplyRequestBodyToJson(this);
}
