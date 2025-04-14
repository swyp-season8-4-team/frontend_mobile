import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/domain/model/store/store_summary_model.dart';
import 'package:frontend_mobile/domain/param/store/get_my_preferences_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/param/store/get_store_summary_params.dart';
import 'package:frontend_mobile/domain/param/store/get_stores_by_location_params.dart';

abstract interface class StoreRepository {
  Future<Result<List<StoreByLocationModel>, CustomException>>
  getStoresByLocation({required GetStoresByLocationParams params});

  Future<Result<List<StoreByLocationModel>, CustomException>>
  getMyPreferencesStoresByLocation({
    required GetMyPreferencesStoresByLocationParams params,
  });

  Future<Result<StoreSummaryModel, CustomException>> getStoreSummary({
    required GetStoreSummaryParams params,
  });
}
