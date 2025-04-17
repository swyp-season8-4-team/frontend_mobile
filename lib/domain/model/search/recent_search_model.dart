class RecentSearchModel {
  const RecentSearchModel({
    required this.id,
    required this.keyword,
    required this.createdAt,
  });

  final int id;
  final String keyword;
  final DateTime createdAt;
}
