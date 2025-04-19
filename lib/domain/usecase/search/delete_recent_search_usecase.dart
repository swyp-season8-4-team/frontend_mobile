import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/search_repository_impl.dart';
import 'package:frontend_mobile/domain/param/search/delete_recent_search_params.dart';
import 'package:frontend_mobile/domain/repository/search_repository.dart';

final Provider<DeleteRecentSearchUsecase> deleteRecentSearchUsecaseProvider =
    Provider<DeleteRecentSearchUsecase>((Ref ref) {
      return DeleteRecentSearchUsecase(
        repository: ref.read(searchRepositoryProvider),
      );
    });

class DeleteRecentSearchUsecase
    implements Usecase<void, DeleteRecentSearchParams> {
  const DeleteRecentSearchUsecase({required SearchRepository repository})
    : _repository = repository;
  final SearchRepository _repository;

  @override
  Future<Result<void, CustomException>> call({
    required DeleteRecentSearchParams params,
  }) async {
    return await _repository.deleteRecentSearch(params: params);
  }
}
