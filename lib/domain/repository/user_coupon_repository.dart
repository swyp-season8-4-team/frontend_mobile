import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_detail_model.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_model.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_usage_status_model.dart';
import 'package:frontend_mobile/domain/param/user_coupon/get_my_coupon_detail_params.dart';
import 'package:frontend_mobile/domain/param/user_coupon/issue_coupon_params.dart';

abstract interface class UserCouponRepository {
  Future<Result<void, CustomException>> issueCoupon({
    required IssueCouponParams params,
  });

  Future<Result<List<UserCouponModel>, CustomException>> getMyCoupons({
    required NoParams params,
  });

  Future<Result<UserCouponDetailModel, CustomException>> getMyCouponDetail({
    required GetMyCouponDetailParams params,
  });

  Future<Result<UserCouponUsageStatusModel, CustomException>>
  getCouponUsageStatus({required NoParams params});
}
