import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/preference_repository_impl.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/repository/preference_repository.dart';

final Provider<GetAllPreferencesUsecase> getAllPreferencesUsecaseProvider =
    Provider<GetAllPreferencesUsecase>((Ref ref) {
      return GetAllPreferencesUsecase(
        repository: ref.read(preferenceRepositoryProvider),
      );
    });

class GetAllPreferencesUsecase
    implements Usecase<List<PreferenceModel>, NoParams> {
  const GetAllPreferencesUsecase({required PreferenceRepository repository})
    : _repository = repository;
  final PreferenceRepository _repository;

  @override
  Future<Result<List<PreferenceModel>, CustomException>> call({
    required NoParams params,
  }) async {
    return await _repository.getAllPreferences(params: params);
  }
}
