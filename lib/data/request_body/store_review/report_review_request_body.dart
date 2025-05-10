import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/report_review_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class ReportReviewRequestBody {
  factory ReportReviewRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ReportReviewRequestBodyFromJson(json);
  const ReportReviewRequestBody({
    required this.userUuid,
    required this.reportCategoryId,
    this.reportComment,
  });
  final String userUuid;
  final int reportCategoryId;
  final String? reportComment;
}
