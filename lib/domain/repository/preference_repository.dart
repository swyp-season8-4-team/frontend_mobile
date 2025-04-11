import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';

abstract interface class PreferenceRepository {
  Future<Result<List<PreferenceModel>, CustomException>> getAllPreferences({
    required NoParams params,
  });
}
