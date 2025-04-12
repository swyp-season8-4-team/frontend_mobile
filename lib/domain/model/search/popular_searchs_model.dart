class PopularSearchesModel {
  const PopularSearchesModel({
    required this.lastUpdatedTime,
    required this.searches,
  });
  final DateTime lastUpdatedTime;
  final List<PopularSearchModel>? searches;
}

class PopularSearchModel {
  const PopularSearchModel({
    required this.keyword,
    required this.searchCount,
    required this.rank,
    required this.difference,
  });

  final String keyword;
  final int searchCount;
  final int rank;
  final int difference;
}
