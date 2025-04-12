import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/search/popular_searchs_model.dart';
import 'package:frontend_mobile/domain/model/search/recent_search_model.dart';
import 'package:frontend_mobile/domain/param/search/get_popular_searches_params.dart';

abstract interface class SearchRepository {
  Future<Result<List<RecentSearchModel>, CustomException>> getRecentSearches({
    required NoParams params,
  });

  Future<Result<PopularSearchesModel, CustomException>> getPopularSearches({
    required GetPopularSearchesParams params,
  });
}
