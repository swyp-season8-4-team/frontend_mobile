import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/search/get_search_popular_entity.dart';
import 'package:frontend_mobile/data/entity/search/get_search_recent_entity.dart';
import 'package:frontend_mobile/data/query_param/search/get_search_popular_query_param.dart';
import 'package:retrofit/http.dart';

part 'generated/search_remote_data_source.g.dart';

final Provider<SearchRemoteDataSource> searchApiProvider =
    Provider<SearchRemoteDataSource>((Ref ref) {
      return SearchRemoteDataSource(ref.read(appDioProvider));
    });

@RestApi()
abstract class SearchRemoteDataSource {
  factory SearchRemoteDataSource(Dio dio) = _SearchRemoteDataSource;

  @GET('/api/search/recent')
  Future<List<GetSearchRecentEntity>> getRecentSearches();

  @GET('/api/search/popular')
  Future<List<GetSearchPopularEntity>> getPopularSearches({
    @Queries() required GetSearchPopularQueryParam query,
  });

  @DELETE('/api/search/recent/all')
  Future<void> deleteSearchRecentAll();

  @DELETE('/api/search/recent/{id}')
  Future<void> deleteSearchRecent({@Path('id') required String searchId});
}
