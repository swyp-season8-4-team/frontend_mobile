import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'generated/store_review_remote_data_source.g.dart';

final Provider<StoreReviewRemoteDataSource> storeReviewApiProvider =
    Provider<StoreReviewRemoteDataSource>((Ref ref) {
      return StoreReviewRemoteDataSource(ref.read(appDioProvider));
    });

@RestApi()
abstract class StoreReviewRemoteDataSource {
  factory StoreReviewRemoteDataSource(Dio dio) = _StoreReviewRemoteDataSource;

  /// 한줄 리뷰 추가
  @POST('/api/stores/{storeUuid}/reviews')
  @MultiPart()
  Future<void> addStoreReview({
    @Path('storeUuid') required String storeUuid,
    @Part() required String userUuid,
    @Part() required String content,
    @Part() required int rating,
    @Part(name: 'images', contentType: 'image/png') List<File>? images,
  });

  /// 한줄 리뷰 삭제
  @DELETE('/api/stores/{storeUuid}/reviews/{reviewUuid}')
  Future<void> deleteStoreReview({
    @Path('storeUuid') required String storeUuid,
    @Path('reviewUuid') required String reviewUuid,
  });

  /// 한줄 리뷰 수정
  @PATCH('/api/stores/{storeUuid}/reviews/{reviewUuid}')
  Future<void> updateStoreReview({
    @Path('storeUuid') required String storeUuid,
    @Path('reviewUuid') required String reviewUuid,
    @Part() required String content,
    @Part() required int rating,
    @Part(name: 'newImages', contentType: 'image/png') List<File>? newImages,
  });
}
