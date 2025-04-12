import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/search_repository_impl.dart';
import 'package:frontend_mobile/domain/model/search/popular_searchs_model.dart';
import 'package:frontend_mobile/domain/param/search/get_popular_searches_params.dart';
import 'package:frontend_mobile/domain/repository/search_repository.dart';

final Provider<GetPopularSearchesUsecase> getPopularSearchesUsecaseProvider =
    Provider<GetPopularSearchesUsecase>((Ref ref) {
      return GetPopularSearchesUsecase(
        repository: ref.read(searchRepositoryProvider),
      );
    });

class GetPopularSearchesUsecase
    implements Usecase<PopularSearchesModel, GetPopularSearchesParams> {
  const GetPopularSearchesUsecase({required SearchRepository repository})
    : _repository = repository;
  final SearchRepository _repository;

  @override
  Future<Result<PopularSearchesModel, CustomException>> call({
    required GetPopularSearchesParams params,
  }) async {
    return await _repository.getPopularSearches(params: params);
  }
}
