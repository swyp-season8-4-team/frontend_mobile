import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/post_mate_reply_report_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class PostMateReplyReportRequestBody {
  PostMateReplyReportRequestBody({
    required this.userUuid,
    required this.reportCategoryId,
    this.reportComment,
  });

  final String userUuid;
  final int reportCategoryId;
  final String? reportComment;

  Map<String, dynamic> toJson() => _$PostMateReplyReportRequestBodyToJson(this);
}
