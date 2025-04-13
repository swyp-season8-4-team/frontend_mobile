import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/search/search_popular_entity.dart';
import 'package:frontend_mobile/data/entity/search/search_recent_entity.dart';
import 'package:frontend_mobile/data/query_param/search/get_search_popular_query_param.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'generated/search_remote_data_source.g.dart';

final Provider<SearchRemoteDataSource> searchApiProvider =
    Provider<SearchRemoteDataSource>((Ref ref) {
      return SearchRemoteDataSource(ref.read(appDioProvider));
    });

@RestApi()
abstract class SearchRemoteDataSource {
  factory SearchRemoteDataSource(Dio dio) = _SearchRemoteDataSource;

  /// [최근 검색어 조회](https://release.desserbee.com/swagger-ui/index.html#/Search%20Keyword/getRecentSearches)
  @GET('/api/search/recent')
  Future<List<RecentSearchEntity>> getRecentSearches();

  /// [실시간 인기 검색어 조회](https://release.desserbee.com/swagger-ui/index.html#/Search%20Keyword/getPopularSearches)
  @GET('/api/search/popular')
  Future<PopularSearchesEntity> getPopularSearches({
    @Queries() required GetSearchPopularQueryParam query,
  });

  /// [최근 검색어 전체 삭제](https://release.desserbee.com/swagger-ui/index.html#/Search%20Keyword/deleteAllRecentSearches)
  @DELETE('/api/search/recent/all')
  Future<void> deleteSearchRecentAll();

  /// [최근 검색어 삭제](https://release.desserbee.com/swagger-ui/index.html#/Search%20Keyword/deleteRecentSearch)
  @DELETE('/api/search/recent/{id}')
  Future<void> deleteSearchRecent({@Path('id') required String searchId});
}
