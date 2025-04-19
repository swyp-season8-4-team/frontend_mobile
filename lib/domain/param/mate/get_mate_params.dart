class GetMateParams {
  GetMateParams({
    this.from = 0,
    this.to = 10,
    this.keyword,
    this.mateCategoryId,
    this.recruit,
  });

  final int from;
  final int to;
  final String? keyword;
  final int? mateCategoryId;
  final bool? recruit;
}
