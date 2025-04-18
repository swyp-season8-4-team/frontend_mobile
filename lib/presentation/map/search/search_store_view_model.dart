import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/search/popular_searchs_model.dart';
import 'package:frontend_mobile/domain/model/search/recent_search_model.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/domain/param/search/delete_recent_search_params.dart';
import 'package:frontend_mobile/domain/param/search/get_popular_searches_params.dart';
import 'package:frontend_mobile/domain/param/store/get_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/usecase/search/delete_recent_search_all_usecase.dart';
import 'package:frontend_mobile/domain/usecase/search/delete_recent_search_usecase.dart';
import 'package:frontend_mobile/domain/usecase/search/get_popular_searches_usecase.dart';
import 'package:frontend_mobile/domain/usecase/search/get_recent_searches_usecase.dart';
import 'package:frontend_mobile/domain/usecase/store/get_stores_by_location_usecase.dart';

part 'generated/search_store_view_model.freezed.dart';
part 'search_store_state.dart';

final AutoDisposeStateNotifierProvider<SearchStoreViewModel, SearchStoreState>
searchStoreViewModelProvider =
    StateNotifierProvider.autoDispose<SearchStoreViewModel, SearchStoreState>((
      Ref ref,
    ) {
      return SearchStoreViewModel(ref: ref);
    });

class SearchStoreViewModel extends StateNotifier<SearchStoreState> {
  SearchStoreViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(SearchStoreState()) {
    init();
  }

  final Ref _ref;

  Future<void> init() async {
    await Future.wait(<Future<SearchStoreState>>[
      getRecentSearches(),
      getPopularSearches(),
    ]);
    state = state.copyWith(isFirstPageLoading: false);
  }

  // 최근 검색어 조회
  Future<SearchStoreState> getRecentSearches() async {
    state = state.copyWith(getRecentSearchesStatus: Status.loading);

    final Result<List<RecentSearchModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getRecentSearchesUsecaseProvider),
          params: NoParams(),
        );

    result.map(
      success: (Success<List<RecentSearchModel>, CustomException> success) {
        state = state.copyWith(
          getRecentSearchesStatus: Status.success,
          recentSearches: success.data,
        );
      },
      failure: (Failure<List<RecentSearchModel>, CustomException> failure) {
        state = state.copyWith(
          getRecentSearchesStatus: Status.failure,
          getRecentSearchesException: failure.exception.model,
        );
      },
    );

    return state;
  }

  // 인기 검색어 조회
  Future<SearchStoreState> getPopularSearches({int limit = 10}) async {
    state = state.copyWith(getPopularSearchesStatus: Status.loading);

    final Result<PopularSearchesModel, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getPopularSearchesUsecaseProvider),
          params: GetPopularSearchesParams(limit: limit),
        );

    result.map(
      success: (Success<PopularSearchesModel, CustomException> success) {
        state = state.copyWith(
          getPopularSearchesStatus: Status.success,
          popularSearches: success.data,
        );
      },
      failure: (Failure<PopularSearchesModel, CustomException> failure) {
        state = state.copyWith(
          getPopularSearchesStatus: Status.failure,
          getPopularSearchesException: failure.exception.model,
        );
      },
    );

    return state;
  }

  // 최근 검색어 삭제
  Future<SearchStoreState> deleteRecentSearch({
    required String searchId,
  }) async {
    state = state.copyWith(deleteRecentSearchStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(deleteRecentSearchUsecaseProvider),
      params: DeleteRecentSearchParams(searchId: searchId),
    );

    await result.map(
      success: (Success<void, CustomException> success) async {
        await getRecentSearches();
        state = state.copyWith(deleteRecentSearchStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          deleteRecentSearchStatus: Status.failure,
          deleteRecentSearchException: failure.exception.model,
        );
      },
    );

    return state;
  }

  // 최근 검색어 전체 삭제
  Future<SearchStoreState> deleteRecentSearchAll() async {
    state = state.copyWith(deleteRecentSearchAllStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(deleteRecentSearchAllUsecaseProvider),
      params: NoParams(),
    );

    await result.map(
      success: (Success<void, CustomException> success) async {
        await getRecentSearches();
        state = state.copyWith(deleteRecentSearchAllStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          deleteRecentSearchAllStatus: Status.failure,
          deleteRecentSearchAllException: failure.exception.model,
        );
      },
    );

    return state;
  }

  // 검색 키워드 수정
  void updateSearchKeyword({required String searchKeyword}) async {
    // searchKeyword를 빈값으로 업데이트 하는 경우
    // 가게 검색 데이터 호출 상태를 initial로 지정
    if (searchKeyword.isEmpty) {
      state = state.copyWith(
        getStoresStatus: Status.initial,
        stores: <StoreByLocationModel>[],
      );
    }
    state = state.copyWith(searchKeyword: searchKeyword);
  }

  // 가게 검색
  // 서울시 강남구 기준(37.514575, 127.0495556)으로 반경 400키로 거리에 있는 가게 전체 조회
  Future<SearchStoreState> getStores() async {
    state = state.copyWith(getStoresStatus: Status.loading);

    final Result<List<StoreByLocationModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getStoresByLocationUsecaseProvider),
          params: GetStoresByLocationParams(
            latitude: 37.514575,
            longitude: 127.0495556,
            radius: 400 * 1000,
            searchKeyword: state.searchKeyword,
          ),
        );

    result.map(
      success: (Success<List<StoreByLocationModel>, CustomException> success) {
        state = state.copyWith(
          getStoresStatus: Status.success,
          stores: success.data,
        );
      },
      failure: (Failure<List<StoreByLocationModel>, CustomException> failure) {
        state = state.copyWith(
          getStoresStatus: Status.failure,
          getStoresException: failure.exception.model,
        );
      },
    );

    return state;
  }
}
