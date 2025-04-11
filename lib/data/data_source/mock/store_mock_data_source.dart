import 'package:frontend_mobile/data/data_source/remote/store_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/store/store_by_location_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_detail_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_operating_hour_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_summary_entity.dart';
import 'package:frontend_mobile/data/query_param/store/get_my_preferences_stores_by_location_query_param.dart';
import 'package:frontend_mobile/data/query_param/store/get_stores_by_location_query_param.dart';

class StoreMockDataSource implements StoreRemoteDataSource {
  @override
  Future<List<StoreByLocationEntity>> getMyPreferencesStoresByLocation({
    required GetMyPreferencesStoresByLocationQueryParam query,
  }) {
    // TODO: implement getMyPreferencesStoresByLocation
    throw UnimplementedError();
  }

  @override
  Future<StoreDetailEntity> getStoreDetail({required String storeUuid}) {
    // TODO: implement getStoreDetail
    throw UnimplementedError();
  }

  @override
  Future<StoreSummaryEntity> getStoreSummary({required String storeUuid}) {
    // TODO: implement getStoreSummary
    throw UnimplementedError();
  }

  @override
  Future<List<StoreByLocationEntity>> getStoresByLocation({
    required GetStoresByLocationQueryParam query,
  }) async {
    return <StoreByLocationEntity>[
      const StoreByLocationEntity(
        storeId: 1,
        storeUuid: '123456',
        name: '디저트 가게1',
        address: '서울시 강남구 역삼동 어쩌구저쩌구',
        latitude: 37.514575,
        longitude: 127.0495556,
        operatingHours: <StoreOperatingHourEntity>[],
        shortReviewCount: 2,
        tags: <String>[],
      ),
    ];
  }
}
