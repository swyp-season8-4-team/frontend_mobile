import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/data/data_source/remote/preference_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/preference/preference_entity.dart';
import 'package:frontend_mobile/data/mapper/preference_mapper.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/repository/preference_repository.dart';

final Provider<PreferenceRepository> preferenceRepositoryProvider =
    Provider<PreferenceRepository>((Ref ref) {
      return PreferenceRepositoryImpl(api: ref.read(preferenceApiProvider));
    });

class PreferenceRepositoryImpl implements PreferenceRepository {
  const PreferenceRepositoryImpl({required PreferenceRemoteDataSource api})
    : _api = api;
  final PreferenceRemoteDataSource _api;

  @override
  Future<Result<List<PreferenceModel>, CustomException>> getAllPreferences({
    required NoParams params,
  }) async {
    return await apiCall(
      api: () async {
        final List<PreferenceEntity> result = await _api.getAllPreferences();
        return result.map((PreferenceEntity e) => e.toModel()).toList();
      },
    );
  }
}
