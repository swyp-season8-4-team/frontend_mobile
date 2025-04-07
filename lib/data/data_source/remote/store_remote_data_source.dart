import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/store/store_detail_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_by_location_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_summary_entity.dart';
import 'package:frontend_mobile/data/query_param/store/get_my_preferences_stores_by_location_query_param.dart';
import 'package:frontend_mobile/data/query_param/store/get_stores_by_location_query_param.dart';
import 'package:retrofit/http.dart';

part 'generated/store_remote_data_source.g.dart';

final Provider<StoreRemoteDataSource> storeApiProvider =
    Provider<StoreRemoteDataSource>((Ref ref) {
      return StoreRemoteDataSource(ref.read(appDioProvider));
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
