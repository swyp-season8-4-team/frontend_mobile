import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/report_review_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class ReportReviewRequestBody {
  const ReportReviewRequestBody({
    required this.userUuid,
    required this.reportCategoryId,
    this.reportComment,
  });

  Map<String, dynamic> toJson() => _$ReportReviewRequestBodyToJson(this);
  final String userUuid;
  final int reportCategoryId;
  final String? reportComment;
}
