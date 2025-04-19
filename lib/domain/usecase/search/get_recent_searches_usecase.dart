import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/search_repository_impl.dart';
import 'package:frontend_mobile/domain/model/search/recent_search_model.dart';
import 'package:frontend_mobile/domain/repository/search_repository.dart';

final Provider<GetRecentSearchesUsecase> getRecentSearchesUsecaseProvider =
    Provider<GetRecentSearchesUsecase>((Ref ref) {
      return GetRecentSearchesUsecase(
        repository: ref.read(searchRepositoryProvider),
      );
    });

class GetRecentSearchesUsecase
    implements Usecase<List<RecentSearchModel>, NoParams> {
  const GetRecentSearchesUsecase({required SearchRepository repository})
    : _repository = repository;

  final SearchRepository _repository;

  @override
  Future<Result<List<RecentSearchModel>, CustomException>> call({
    required NoParams params,
  }) async {
    return await _repository.getRecentSearches(params: params);
  }
}
