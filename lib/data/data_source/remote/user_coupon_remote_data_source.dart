import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_detail_entity.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_entity.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_issue_status_entity.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_usage_status_entity.dart';
import 'package:frontend_mobile/data/request_body/user_coupon/issue_coupon_request_body.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'generated/user_coupon_remote_data_source.g.dart';

final Provider<UserCouponRemoteDataSource> userCouponApiProvider =
    Provider<UserCouponRemoteDataSource>((Ref ref) {
      return UserCouponRemoteDataSource(ref.read(appDioProvider));
    });

@RestApi()
abstract class UserCouponRemoteDataSource {
  factory UserCouponRemoteDataSource(Dio dio) = _UserCouponRemoteDataSource;

  /// 쿠폰 발급
  @POST('/api/users/coupons/issue')
  Future<void> issueCoupon({@Body() required IssueCouponRequestBody body});

  /// 발급받은 쿠폰 목록 조회
  @GET('/api/users/coupons/my')
  Future<List<UserCouponEntity>> getMyCoupons();

  /// 발급받은 쿠폰 상세 조회
  @GET('/api/users/coupons/my/{userCouponId}')
  Future<UserCouponDetailEntity> getMyCouponDetail({
    @Path() required String userCouponId,
  });

  /// 쿠폰 사용 현황 조회
  @GET('/api/users/coupon/usage-status')
  Future<UserCouponUsageStatusEntity> getCouponUsageStatus();

  /// 사용자의 쿠폰 발급 여부 조회
  @GET('/api/users/coupons/{storeUuid}/issued')
  Future<List<CouponIssueStatusEntity>> getCouponIssueStatus({
    @Path() required String storeUuid,
  });
}
