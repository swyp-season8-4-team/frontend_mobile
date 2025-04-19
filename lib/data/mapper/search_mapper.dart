import 'package:frontend_mobile/data/entity/search/search_popular_entity.dart';
import 'package:frontend_mobile/data/entity/search/search_recent_entity.dart';
import 'package:frontend_mobile/domain/model/search/popular_searchs_model.dart';
import 'package:frontend_mobile/domain/model/search/recent_search_model.dart';

extension RecentSearchEntityExt on RecentSearchEntity {
  RecentSearchModel toModel() =>
      RecentSearchModel(id: id, keyword: keyword, createdAt: createdAt);
}

extension PopularSearchsEntityExt on PopularSearchesEntity {
  PopularSearchesModel toModel() => PopularSearchesModel(
    lastUpdatedTime: lastUpdatedTime,
    searches:
        searches
            ?.map(
              //ignore: always_specify_types
              (e) => PopularSearchModel(
                keyword: e.keyword,
                searchCount: e.searchCount,
                rank: e.rank,
                difference: e.difference,
              ),
            )
            .toList(),
  );
}
