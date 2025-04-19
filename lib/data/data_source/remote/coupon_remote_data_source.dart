import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/coupon/coupon_entity.dart';
import 'package:retrofit/http.dart';

part 'generated/coupon_remote_data_source.g.dart';

final Provider<CouponRemoteDataSource> couponApiProvider =
    Provider<CouponRemoteDataSource>((Ref ref) {
      return CouponRemoteDataSource(ref.read(appDioProvider));
    });

@RestApi()
abstract class CouponRemoteDataSource {
  factory CouponRemoteDataSource(Dio dio) = _CouponRemoteDataSource;

  @GET('/api/coupons/{storeUuid}')
  Future<List<CouponEntity>> getCouponsByStore({
    @Path() required String storeUuid,
  });
}
