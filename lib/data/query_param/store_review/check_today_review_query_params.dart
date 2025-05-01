import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/check_today_review_query_params.g.dart';

@JsonSerializable()
class CheckTodayReviewQueryParams {
  const CheckTodayReviewQueryParams({required this.userUuid});
  final String userUuid;

  Map<String, dynamic> toJson() => _$CheckTodayReviewQueryParamsToJson(this);
}
