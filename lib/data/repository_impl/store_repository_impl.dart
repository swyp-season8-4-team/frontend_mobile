import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/store_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/store/store_by_location_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_detail_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_summary_entity.dart';
import 'package:frontend_mobile/data/mapper/store_mapper.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:frontend_mobile/domain/model/store/store_summary_model.dart';
import 'package:frontend_mobile/domain/param/store/get_my_preferences_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/param/store/get_store_detail_params.dart';
import 'package:frontend_mobile/domain/param/store/get_store_summary_params.dart';
import 'package:frontend_mobile/domain/param/store/get_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/repository/store_repository.dart';

final Provider<StoreRepository> storeRepositoryProvider =
    Provider<StoreRepository>((Ref ref) {
      return StoreRepositoryImpl(api: ref.read(storeApiProvider));
    });

class StoreRepositoryImpl implements StoreRepository {
  const StoreRepositoryImpl({required StoreRemoteDataSource api}) : _api = api;
  final StoreRemoteDataSource _api;

  @override
  Future<Result<List<StoreByLocationModel>, CustomException>>
  getStoresByLocation({required GetStoresByLocationParams params}) async {
    return await apiCall(
      api: () async {
        final List<StoreByLocationEntity> result = await _api
            .getStoresByLocation(query: params.toQuery());
        return result.map((StoreByLocationEntity e) => e.toModel()).toList();
      },
    );
  }

  @override
  Future<Result<List<StoreByLocationModel>, CustomException>>
  getMyPreferencesStoresByLocation({
    required GetMyPreferencesStoresByLocationParams params,
  }) async {
    return await apiCall(
      api: () async {
        final List<StoreByLocationEntity> result = await _api
            .getMyPreferencesStoresByLocation(query: params.toQuery());
        return result.map((StoreByLocationEntity e) => e.toModel()).toList();
      },
    );
  }

  @override
  Future<Result<StoreSummaryModel, CustomException>> getStoreSummary({
    required GetStoreSummaryParams params,
  }) async {
    return await apiCall(
      api: () async {
        final StoreSummaryEntity result = await _api.getStoreSummary(
          storeUuid: params.storeUuid,
        );
        return result.toModel();
      },
    );
  }

  @override
  Future<Result<StoreDetailModel, CustomException>> getStoreDetail({
    required GetStoreDetailParams params,
  }) async {
    return await apiCall(
      api: () async {
        final StoreDetailEntity result = await _api.getStoreDetail(
          storeUuid: params.storeUuid,
        );
        return result.toModel();
      },
    );
  }
}
