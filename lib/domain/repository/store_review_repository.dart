import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/param/store_review/add_store_review_params.dart';
import 'package:frontend_mobile/domain/param/store_review/check_today_review_params.dart';
import 'package:frontend_mobile/domain/param/store_review/delete_store_review_params.dart';
import 'package:frontend_mobile/domain/param/store_review/update_store_review_params.dart';

abstract interface class StoreReviewRepository {
  Future<Result<void, CustomException>> addStoreReview({
    required AddStoreReviewParams params,
  });

  Future<Result<void, CustomException>> deleteStoreReview({
    required DeleteStoreReviewParams params,
  });

  Future<Result<void, CustomException>> updateStoreReview({
    required UpdateStoreReviewParams params,
  });

  Future<Result<bool, CustomException>> checkTodayReview({
    required CheckTodayReviewParams params,
  });
}
