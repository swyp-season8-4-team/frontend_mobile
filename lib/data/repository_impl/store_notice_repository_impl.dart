import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/store_notice_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/store_notice/store_notice_entity.dart';
import 'package:frontend_mobile/data/mapper/store_notice_mapper.dart';
import 'package:frontend_mobile/domain/model/store_notice/store_notice_model.dart';
import 'package:frontend_mobile/domain/param/store_notice/get_store_notices_params.dart';
import 'package:frontend_mobile/domain/repository/store_notice_repository.dart';

final Provider<StoreNoticeRepository> storeNoticeRepositoryProvider =
    Provider<StoreNoticeRepository>((Ref ref) {
      return StoreNoticeRepositoryImpl(api: ref.read(storeNoticeApiProvider));
    });

class StoreNoticeRepositoryImpl implements StoreNoticeRepository {
  const StoreNoticeRepositoryImpl({required StoreNoticeRemoteDataSource api})
    : _api = api;
  final StoreNoticeRemoteDataSource _api;

  @override
  Future<Result<List<StoreNoticeModel>, CustomException>> getStoreNotices({
    required GetStoreNoticesParams params,
  }) async {
    return await apiCall(
      api: () async {
        final List<StoreNoticeEntity> result = await _api.getStoreNotices(
          storeUuid: params.storeUuid,
        );
        return result.map((StoreNoticeEntity e) => e.toModel()).toList();
      },
    );
  }
}
