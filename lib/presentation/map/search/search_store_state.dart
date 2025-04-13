part of 'search_store_view_model.dart';

@freezed
class SearchStoreState with _$SearchStoreState {
  factory SearchStoreState({
    @Default(<RecentSearchModel>[]) List<RecentSearchModel> recentSearches,
    @Default(Status.loading) Status getRecentSearchesStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getRecentSearchesException,
    PopularSearchesModel? popularSearches,
    @Default(Status.loading) Status getPopularSearchesStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getPopularSearchesException,
    @Default(Status.initial) Status deleteRecentSearchStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel deleteRecentSearchException,
    @Default(Status.initial) Status deleteRecentSearchAllStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel deleteRecentSearchAllException,
  }) = _SearchStoreState;

  const SearchStoreState._();

  // 페이지 전환에 따른 첫로딩
  bool get isFirstLoading =>
      getPopularSearchesStatus.isLoading &&
      getRecentSearchesStatus.isLoading &&
      deleteRecentSearchStatus.isInitial &&
      deleteRecentSearchAllStatus.isInitial;
}
