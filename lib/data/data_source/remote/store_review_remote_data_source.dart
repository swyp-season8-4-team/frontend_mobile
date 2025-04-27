import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import 'package:http_parser/http_parser.dart';

part 'generated/store_review_remote_data_source.g.dart';

final Provider<StoreReviewRemoteDataSource> storeReviewApiProvider =
    Provider<StoreReviewRemoteDataSource>((Ref ref) {
      return StoreReviewRemoteDataSource(ref.read(appDioProvider));
    });

final Provider<AddStoreReviewApi> addStoreReviewApiProvider =
    Provider<AddStoreReviewApi>((Ref ref) {
      return AddStoreReviewApiImpl(dio: ref.read(appDioProvider));
    });

final Provider<UpdateStoreReviewApi> updateStoreReviewApiProvider =
    Provider<UpdateStoreReviewApi>((Ref ref) {
      return UpdateStoreReviewApiImpl(ref.read(appDioProvider));
    });

@RestApi()
abstract class StoreReviewRemoteDataSource {
  factory StoreReviewRemoteDataSource(Dio dio) = _StoreReviewRemoteDataSource;

  /// 한줄 리뷰 추가 (사용 불가능)
  @POST('/api/stores/{storeUuid}/reviews')
  @MultiPart()
  Future<void> addStoreReview({
    @Path('storeUuid') required String storeUuid,
    @Part(contentType: 'application/json') required String request,
    @Part(name: 'images', contentType: 'image/png') List<File>? images,
  });

  /// 한줄 리뷰 삭제
  @DELETE('/api/stores/{storeUuid}/reviews/{reviewUuid}')
  Future<void> deleteStoreReview({
    @Path('storeUuid') required String storeUuid,
    @Path('reviewUuid') required String reviewUuid,
  });

  /// 한줄 리뷰 수정 (사용 불가능)
  @PATCH('/api/stores/{storeUuid}/reviews/{reviewUuid}')
  Future<void> updateStoreReview({
    @Path('storeUuid') required String storeUuid,
    @Path('reviewUuid') required String reviewUuid,
    @Part() required String content,
    @Part() required int rating,
    @Part(name: 'newImages', contentType: 'image/png') List<File>? newImages,
  });
}

/// 한줄 리뷰 추가 API
abstract interface class AddStoreReviewApi {
  Future<void> addStoreReview({
    required String storeUuid,
    required Map<String, dynamic> request, // request는 Map으로 받자
    List<File>? images,
  });
}

class AddStoreReviewApiImpl implements AddStoreReviewApi {
  AddStoreReviewApiImpl({required this.dio});
  final Dio dio;

  @override
  Future<void> addStoreReview({
    required String storeUuid,
    required Map<String, dynamic> request, // request는 Map으로 받자
    List<File>? images,
  }) async {
    final String url = '/api/stores/$storeUuid/reviews';

    final FormData formData = FormData();

    // JSON 데이터를 MultipartFile로 변환
    formData.files.add(
      MapEntry<String, MultipartFile>(
        'request',
        MultipartFile.fromString(
          jsonEncode(request),
          contentType: MediaType('application', 'json'),
        ),
      ),
    );

    // 이미지 파일들 추가
    if (images != null && images.isNotEmpty) {
      for (final File image in images) {
        formData.files.add(
          MapEntry<String, MultipartFile>(
            'images',
            await MultipartFile.fromFile(
              image.path,
              contentType: MediaType('image', 'png'),
            ),
          ),
        );
      }
    }

    await dio.post(
      url,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
  }
}

/// 한줄 리뷰 수정 API
abstract interface class UpdateStoreReviewApi {
  Future<void> updateStoreReview({
    required String storeUuid,
    required String reviewUuid,
    required Map<String, dynamic> request,
    List<File>? newImages,
  });
}

class UpdateStoreReviewApiImpl implements UpdateStoreReviewApi {
  UpdateStoreReviewApiImpl(this.dio);
  final Dio dio;

  @override
  Future<void> updateStoreReview({
    required String storeUuid,
    required String reviewUuid,
    required Map<String, dynamic> request,
    List<File>? newImages,
  }) async {
    final String url = '/api/stores/$storeUuid/reviews/$reviewUuid';

    final FormData formData = FormData();

    // JSON 데이터를 MultipartFile로 변환
    formData.files.add(
      MapEntry<String, MultipartFile>(
        'request',
        MultipartFile.fromString(
          jsonEncode(request),
          contentType: MediaType('application', 'json'),
        ),
      ),
    );

    // newImages 추가 (optional)
    if (newImages != null && newImages.isNotEmpty) {
      for (final File image in newImages) {
        formData.files.add(
          MapEntry<String, MultipartFile>(
            'newImages',
            await MultipartFile.fromFile(
              image.path,
              contentType: MediaType('image', 'png'),
            ),
          ),
        );
      }
    }

    await dio.patch(
      url,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
  }
}
