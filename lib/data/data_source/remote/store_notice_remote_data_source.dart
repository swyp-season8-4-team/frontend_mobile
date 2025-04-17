import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/store_notice/store_notice_entity.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'generated/store_notice_remote_data_source.g.dart';

final Provider<StoreNoticeRemoteDataSource> storeNoticeApiProvider =
    Provider<StoreNoticeRemoteDataSource>((Ref ref) {
      return StoreNoticeRemoteDataSource(ref.read(appDioProvider));
    });

@RestApi()
abstract class StoreNoticeRemoteDataSource {
  factory StoreNoticeRemoteDataSource(Dio dio) = _StoreNoticeRemoteDataSource;

  /// 공지 리스트 조회
  @GET('/api/stores/{storeUuid}/notices')
  Future<List<StoreNoticeEntity>> getStoreNotices({
    @Path() required String storeUuid,
  });
}
