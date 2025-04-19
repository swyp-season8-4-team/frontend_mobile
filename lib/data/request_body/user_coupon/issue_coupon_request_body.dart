import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/issue_coupon_request_body.g.dart';

@JsonSerializable()
class IssueCouponRequestBody {
  const IssueCouponRequestBody({
    required this.userUuid,
    required this.couponUuid,
  });
  final String userUuid;
  final String couponUuid;

  Map<String, dynamic> toJson() => _$IssueCouponRequestBodyToJson(this);
}
