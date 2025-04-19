import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/coupon/coupon_model.dart';
import 'package:frontend_mobile/domain/param/coupon/get_coupons_by_store_params.dart';

abstract interface class CouponRepository {
  Future<Result<List<CouponModel>, CustomException>> getCouponsByStore({
    required GetCouponsByStoreParams params,
  });
}
