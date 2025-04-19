import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/user_coupon_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_detail_entity.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_entity.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_usage_status_entity.dart';
import 'package:frontend_mobile/data/mapper/user_coupon_mapper.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_detail_model.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_model.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_usage_status_model.dart';
import 'package:frontend_mobile/domain/param/user_coupon/get_my_coupon_detail_params.dart';
import 'package:frontend_mobile/domain/param/user_coupon/issue_coupon_params.dart';
import 'package:frontend_mobile/domain/repository/user_coupon_repository.dart';

final Provider<UserCouponRepository> userCouponRepositoryProvider =
    Provider<UserCouponRepository>((Ref ref) {
      return UserCouponRepositoryImpl(api: ref.read(userCouponApiProvider));
    });

class UserCouponRepositoryImpl implements UserCouponRepository {
  const UserCouponRepositoryImpl({required UserCouponRemoteDataSource api})
    : _api = api;
  final UserCouponRemoteDataSource _api;

  @override
  Future<Result<void, CustomException>> issueCoupon({
    required IssueCouponParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await _api.issueCoupon(body: params.toBody());
      },
    );
  }

  @override
  Future<Result<List<UserCouponModel>, CustomException>> getMyCoupons({
    required NoParams params,
  }) async {
    return await apiCall(
      api: () async {
        final List<UserCouponEntity> result = await _api.getMyCoupons();
        return result.map((UserCouponEntity e) => e.toModel()).toList();
      },
    );
  }

  @override
  Future<Result<UserCouponDetailModel, CustomException>> getMyCouponDetail({
    required GetMyCouponDetailParams params,
  }) async {
    return await apiCall(
      api: () async {
        final UserCouponDetailEntity result = await _api.getMyCouponDetail(
          userCouponId: params.userCouponId,
        );
        return result.toModel();
      },
    );
  }

  @override
  Future<Result<UserCouponUsageStatusModel, CustomException>>
  getCouponUsageStatus({required NoParams params}) async {
    return await apiCall(
      api: () async {
        final UserCouponUsageStatusEntity result =
            await _api.getCouponUsageStatus();
        return result.toModel();
      },
    );
  }
}
