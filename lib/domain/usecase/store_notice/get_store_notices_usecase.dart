import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/store_notice_repository_impl.dart';
import 'package:frontend_mobile/domain/model/store_notice/store_notice_model.dart';
import 'package:frontend_mobile/domain/param/store_notice/get_store_notices_params.dart';
import 'package:frontend_mobile/domain/repository/store_notice_repository.dart';

final Provider<GetStoreNoticesUsecase> getStoreNoticesUsecaseProvider =
    Provider<GetStoreNoticesUsecase>((Ref ref) {
      return GetStoreNoticesUsecase(
        repository: ref.read(storeNoticeRepositoryProvider),
      );
    });

class GetStoreNoticesUsecase
    implements Usecase<List<StoreNoticeModel>, GetStoreNoticesParams> {
  const GetStoreNoticesUsecase({required StoreNoticeRepository repository})
    : _repository = repository;
  final StoreNoticeRepository _repository;

  @override
  Future<Result<List<StoreNoticeModel>, CustomException>> call({
    required GetStoreNoticesParams params,
  }) async {
    return await _repository.getStoreNotices(params: params);
  }
}
