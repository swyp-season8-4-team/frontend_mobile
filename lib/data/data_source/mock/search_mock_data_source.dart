import 'package:frontend_mobile/data/data_source/remote/search_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/search/search_popular_entity.dart';
import 'package:frontend_mobile/data/entity/search/search_recent_entity.dart';
import 'package:frontend_mobile/data/query_param/search/get_search_popular_query_param.dart';

class SearchMockDataSource implements SearchRemoteDataSource {
  @override
  Future<void> deleteSearchRecent({required String searchId}) {
    // TODO: implement deleteSearchRecent
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSearchRecentAll() {
    // TODO: implement deleteSearchRecentAll
    throw UnimplementedError();
  }

  @override
  Future<List<RecentSearchEntity>> getRecentSearches() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return <RecentSearchEntity>[
      RecentSearchEntity(
        id: 1,
        keyword: 'keyword 1',
        createdAt: DateTime.now(),
      ),
      RecentSearchEntity(
        id: 2,
        keyword: 'keyword 2',
        createdAt: DateTime.now(),
      ),
      RecentSearchEntity(
        id: 3,
        keyword: 'keyword 3',
        createdAt: DateTime.now(),
      ),
      RecentSearchEntity(
        id: 4,
        keyword: 'keyword 4',
        createdAt: DateTime.now(),
      ),
      RecentSearchEntity(
        id: 5,
        keyword: 'keyword 5',
        createdAt: DateTime.now(),
      ),
      RecentSearchEntity(
        id: 6,
        keyword: 'keyword 6',
        createdAt: DateTime.now(),
      ),
    ];
  }

  @override
  Future<PopularSearchesEntity> getPopularSearches({
    required GetSearchPopularQueryParam query,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return PopularSearchesEntity(
      lastUpdatedTime: DateTime.now(),
      searches: <PopularSearch>[
        const PopularSearch(
          keyword: 'keyword 1',
          searchCount: 1,
          rank: 1,
          difference: 2,
        ),
        const PopularSearch(
          keyword: 'keyword 2',
          searchCount: 1,
          rank: 2,
          difference: -2,
        ),
        const PopularSearch(
          keyword: 'keyword 3',
          searchCount: 1,
          rank: 3,
          difference: 3,
        ),
        const PopularSearch(
          keyword: 'keyword 4',
          searchCount: 1,
          rank: 4,
          difference: 1,
        ),
        const PopularSearch(
          keyword: 'keyword 5',
          searchCount: 1,
          rank: 5,
          difference: 0,
        ),
        const PopularSearch(
          keyword: 'keyword 6',
          searchCount: 1,
          rank: 6,
          difference: 0,
        ),
        const PopularSearch(
          keyword: 'keyword 7',
          searchCount: 1,
          rank: 7,
          difference: -2,
        ),
        const PopularSearch(
          keyword: 'keyword 8',
          searchCount: 1,
          rank: 8,
          difference: -5,
        ),
        const PopularSearch(
          keyword: 'keyword 9',
          searchCount: 1,
          rank: 9,
          difference: 1,
        ),
        const PopularSearch(
          keyword: 'keyword 10',
          searchCount: 1,
          rank: 10,
          difference: 2,
        ),
      ],
    );
  }
}
