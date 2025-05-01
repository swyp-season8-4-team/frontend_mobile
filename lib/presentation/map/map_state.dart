part of 'map_view_model.dart';

typedef UserStoreListOptionMenuVisible =
    ({int listId, bool isOptionMenuVisible});

@freezed
class MapState with _$MapState {
  factory MapState({
    @Default(<StoreByLocationModel>[])
    List<StoreByLocationModel> storesByLocation,
    @Default(37.514575) double lat,
    @Default(127.0495556) double lng,
    @Default(5) double radius,
    @Default(false) bool myPreferenceFilterSelected,
    List<int>? preferenceTagIds,
    String? searchKeyword,
    @Default(Status.loading) Status getStoresByLocationStatus,
    @Default(Status.loading) Status getMyPreferencesStoresByLocationStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoresByLocationExceptionModel,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getMyPreferencesStoresByLocationExceptionModel,

    StoreSummaryModel? storeSummary,
    @Default(Status.initial) Status getStoreSummaryStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoreSummaryExceptionModel,

    NMarker? selectedMarker,
    int? selectedListId,

    @Default(false) bool userStoresEnabled,

    @Default(Status.initial) Status deleteUserStoreListStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel deleteUserStoreListException,
  }) = _MapState;
}
