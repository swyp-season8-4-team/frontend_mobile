import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/search_repository_impl.dart';
import 'package:frontend_mobile/domain/repository/search_repository.dart';

final Provider<DeleteRecentSearchAllUsecase>
deleteRecentSearchAllUsecaseProvider = Provider<DeleteRecentSearchAllUsecase>((
  Ref ref,
) {
  return DeleteRecentSearchAllUsecase(
    repository: ref.read(searchRepositoryProvider),
  );
});

class DeleteRecentSearchAllUsecase implements Usecase<void, NoParams> {
  const DeleteRecentSearchAllUsecase({required SearchRepository repository})
    : _repository = repository;
  final SearchRepository _repository;

  @override
  Future<Result<void, CustomException>> call({required NoParams params}) async {
    return await _repository.deleteRecentSearchAll(params: params);
  }
}
