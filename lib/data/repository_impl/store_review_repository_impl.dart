import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/store_review_remote_data_source.dart';
import 'package:frontend_mobile/domain/param/store_review/add_store_review_params.dart';
import 'package:frontend_mobile/domain/param/store_review/delete_store_review_params.dart';
import 'package:frontend_mobile/domain/param/store_review/update_store_review_params.dart';
import 'package:frontend_mobile/domain/repository/store_review_repository.dart';

final Provider<StoreReviewRepository> storeReviewRepositoryProvider =
    Provider<StoreReviewRepository>((Ref ref) {
      return StoreReviewRepositoryImpl(
        api: ref.read(storeReviewApiProvider),
        addStoreReviewApi: ref.read(addStoreReviewApiProvider),
        updateStoreReviewApi: ref.read(updateStoreReviewApiProvider),
      );
    });

class StoreReviewRepositoryImpl implements StoreReviewRepository {
  const StoreReviewRepositoryImpl({
    required StoreReviewRemoteDataSource api,
    required AddStoreReviewApi addStoreReviewApi,
    required UpdateStoreReviewApi updateStoreReviewApi,
  }) : _updateStoreReviewApi = updateStoreReviewApi,
       _addStoreReviewApi = addStoreReviewApi,
       _api = api;
  final StoreReviewRemoteDataSource _api;
  final AddStoreReviewApi _addStoreReviewApi;
  final UpdateStoreReviewApi _updateStoreReviewApi;

  @override
  Future<Result<void, CustomException>> addStoreReview({
    required AddStoreReviewParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await _addStoreReviewApi.addStoreReview(
          storeUuid: params.storeUuid,
          images: params.images,
          request: <String, dynamic>{
            'userUuid': params.userUuid,
            'content': params.content,
            'rating': params.rating,
          },
        );
      },
    );
  }

  @override
  Future<Result<void, CustomException>> deleteStoreReview({
    required DeleteStoreReviewParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await _api.deleteStoreReview(
          storeUuid: params.storeUuid,
          reviewUuid: params.reviewUuid,
        );
      },
    );
  }

  @override
  Future<Result<void, CustomException>> updateStoreReview({
    required UpdateStoreReviewParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await _updateStoreReviewApi.updateStoreReview(
          storeUuid: params.storeUuid,
          reviewUuid: params.reviewUuid,
          request: <String, dynamic>{
            'content': params.content,
            'rating': params.rating,
          },
          newImages: params.newImages,
        );
      },
    );
  }
}
