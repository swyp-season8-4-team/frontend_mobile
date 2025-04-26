import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/store/store_detail_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_by_location_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_summary_entity.dart';
import 'package:frontend_mobile/data/query_param/store/get_my_preferences_stores_by_location_query_param.dart';
import 'package:frontend_mobile/data/query_param/store/get_stores_by_location_query_param.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'generated/store_remote_data_source.g.dart';

final Provider<StoreRemoteDataSource> storeApiProvider =
    Provider<StoreRemoteDataSource>((Ref ref) {
      return StoreRemoteDataSource(ref.read(appDioProvider));
    });

final Provider<GetStoresByLocation> getStoresByLocationApiProvider =
    Provider<GetStoresByLocation>((Ref ref) {
      return GetStoresByLocation(dio: ref.read(appDioProvider));
    });

@RestApi()
abstract class StoreRemoteDataSource {
  factory StoreRemoteDataSource(Dio dio) = _StoreRemoteDataSource;

  /// [가게 간략 정보 조회](https://release.desserbee.com/swagger-ui/index.html#/Store/getStoreSummary)
  @GET('/api/stores/{storeUuid}/summary')
  Future<StoreSummaryEntity> getStoreSummary({
    @Path() required String storeUuid,
  });

  /// [가게 상세 정보 조회](https://release.desserbee.com/swagger-ui/index.html#/Store/getStoreDetails)
  @GET('/api/stores/{storeUuid}/details')
  Future<StoreDetailEntity> getStoreDetail({@Path() required String storeUuid});

  /// [반경 내 가게 조회](https://release.desserbee.com/swagger-ui/index.html#/Store/getStoresByLocation)
  @GET('/api/stores/map')
  Future<List<StoreByLocationEntity>> getStoresByLocation({
    @Queries() required GetStoresByLocationQueryParam query,
  });

  /// [반경 내 사용자 취향 가게 조회](https://release.desserbee.com/swagger-ui/index.html#/Store/getStoresByMyPreferences)
  @GET('/api/stores/map/my-preferences')
  Future<List<StoreByLocationEntity>> getMyPreferencesStoresByLocation({
    @Queries() required GetMyPreferencesStoresByLocationQueryParam query,
  });
}

/// 반경 내 가게 조회 (Retrofit 사용 안함)
class GetStoresByLocation {
  const GetStoresByLocation({required this.dio});
  final Dio dio;

  Future<List<StoreByLocationEntity>> invoke({
    required GetStoresByLocationQueryParam query,
  }) async {
    final Response<dynamic> result = await dio.get(
      '/api/stores/map',
      queryParameters: <String, dynamic>{
        'latitude': query.latitude,
        'longitude': query.longitude,
        'radius': query.radius,
        // Query Params에 들어간 comma가 자동으로 인코딩 되는 것을 방지하기 위함
        if (query.preferenceTagIds case final List<int> value?)
          'preferenceTagIds': ListParam<int>(value, ListFormat.csv),
        if (query.searchKeyword case final String value?)
          'searchKeyword': value,
      },
    );

    final List<dynamic> data = result.data as List<dynamic>;
    return data
        .map(
          (dynamic json) =>
              StoreByLocationEntity.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }
}
