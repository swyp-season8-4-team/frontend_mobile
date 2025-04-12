import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/search_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/search/search_popular_entity.dart';
import 'package:frontend_mobile/data/entity/search/search_recent_entity.dart';
import 'package:frontend_mobile/data/mapper/search_mapper.dart';
import 'package:frontend_mobile/data/query_param/search/get_search_popular_query_param.dart';
import 'package:frontend_mobile/domain/model/search/popular_searchs_model.dart';
import 'package:frontend_mobile/domain/model/search/recent_search_model.dart';
import 'package:frontend_mobile/domain/param/search/delete_recent_search_params.dart';
import 'package:frontend_mobile/domain/param/search/get_popular_searches_params.dart';
import 'package:frontend_mobile/domain/repository/search_repository.dart';

final Provider<SearchRepository> searchRepositoryProvider =
    Provider<SearchRepository>((Ref ref) {
      return SearchRepositoryImpl(api: ref.read(searchApiProvider));
    });

class SearchRepositoryImpl implements SearchRepository {
  const SearchRepositoryImpl({required SearchRemoteDataSource api})
    : _api = api;
  final SearchRemoteDataSource _api;

  @override
  Future<Result<List<RecentSearchModel>, CustomException>> getRecentSearches({
    required NoParams params,
  }) async {
    return await apiCall(
      api: () async {
        final List<RecentSearchEntity> result = await _api.getRecentSearches();
        return result.map((RecentSearchEntity e) => e.toModel()).toList();
      },
    );
  }

  @override
  Future<Result<PopularSearchesModel, CustomException>> getPopularSearches({
    required GetPopularSearchesParams params,
  }) async {
    return await apiCall(
      api: () async {
        final PopularSearchesEntity result = await _api.getPopularSearches(
          query: GetSearchPopularQueryParam(limit: params.limit),
        );
        return result.toModel();
      },
    );
  }

  @override
  Future<Result<void, CustomException>> deleteRecentSearch({
    required DeleteRecentSearchParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await _api.deleteSearchRecent(searchId: params.searchId);
      },
    );
  }

  @override
  Future<Result<void, CustomException>> deleteRecentSearchAll({
    required NoParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await _api.deleteSearchRecentAll();
      },
    );
  }
}
