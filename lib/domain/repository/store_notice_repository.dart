import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/store_notice/store_notice_model.dart';
import 'package:frontend_mobile/domain/param/store_notice/get_store_notices_params.dart';

abstract interface class StoreNoticeRepository {
  Future<Result<List<StoreNoticeModel>, CustomException>> getStoreNotices({
    required GetStoreNoticesParams params,
  });
}
