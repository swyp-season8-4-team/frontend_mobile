part of 'search_store_view_model.dart';

@freezed
class SearchStoreState with _$SearchStoreState {
  factory SearchStoreState({
    @Default(true) bool isFirstPageLoading,
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

    String? searchKeyword,
    @Default(<StoreByLocationModel>[]) List<StoreByLocationModel> stores,
    @Default(Status.initial) Status getStoresStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoresException,
  }) = _SearchStoreState;

  const SearchStoreState._();

  bool get isFailure =>
      getPopularSearchesStatus.isFailure ||
      getRecentSearchesStatus.isFailure ||
      deleteRecentSearchStatus.isFailure ||
      deleteRecentSearchAllStatus.isFailure;

  bool get isLoading =>
      getPopularSearchesStatus.isLoading ||
      getRecentSearchesStatus.isLoading ||
      getStoresStatus.isLoading ||
      deleteRecentSearchStatus.isLoading ||
      deleteRecentSearchAllStatus.isLoading;
}
