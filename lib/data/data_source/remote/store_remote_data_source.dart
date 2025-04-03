import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/store/get_store_detail_entity.dart';
import 'package:frontend_mobile/data/entity/store/get_store_from_map_entity.dart';
import 'package:frontend_mobile/data/entity/store/get_store_summary_entity.dart';
import 'package:frontend_mobile/data/query_param/store/get_my_preferences_stores_from_map_query_param.dart';
import 'package:frontend_mobile/data/query_param/store/get_stores_from_map_query_param.dart';
import 'package:retrofit/http.dart';

part 'generated/store_remote_data_source.g.dart';

final Provider<StoreRemoteDataSource> storeApiProvider =
    Provider<StoreRemoteDataSource>((Ref ref) {
      return StoreRemoteDataSource(ref.read(appDioProvider));
    });

@RestApi()
abstract class StoreRemoteDataSource {
  factory StoreRemoteDataSource(Dio dio) = _StoreRemoteDataSource;

  @GET('/api/stores/{storeUuid}/summary')
  Future<GetStoreSummaryEntity> getStoreSummary({
    @Path() required String storeUuid,
  });

  @GET('/api/stores/{storeUuid}/details')
  Future<GetStoreDetailEntity> getStoreDetail({
    @Path() required String storeUuid,
  });

  @GET('/api/stores/map')
  Future<List<GetStoreFromMapEntity>> getStoresFromMap({
    @Queries() required GetStoresFromMapQueryParam query,
  });

  @GET('/api/stores/map/my-preferences')
  Future<List<GetStoreFromMapEntity>> getMyPreferencesStoresFromMap({
    @Queries() required GetMyPreferencesStoresFromMapQueryParam query,
  });
}
