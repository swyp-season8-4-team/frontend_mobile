import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase/no_params.dart';
import 'package:frontend_mobile/core/resource/usecase/usecase.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/usecase/preference/get_all_preferences_usecase.dart';

part 'map_state.dart';
part 'generated/map_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<MapViewModel, MapState>
mapViewModelProvider =
    StateNotifierProvider.autoDispose<MapViewModel, MapState>((Ref ref) {
      return MapViewModel(ref: ref);
    });

class MapViewModel extends StateNotifier<MapState> {
  MapViewModel({required Ref<Object?> ref}) : _ref = ref, super(MapState());

  final Ref _ref;

  // 모든 선호도 조회
  Future<MapState> getAllPrferences() async {
    state = state.copyWith(getAllPreferencesStatus: Status.loading);

    final Result<List<PreferenceModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getAllPreferencesUsecaseProvider),
          params: NoParams(),
        );

    result.map(
      success: (Success<List<PreferenceModel>, CustomException> success) {
        state = state.copyWith(
          getAllPreferencesStatus: Status.success,
          preferences: success.data,
        );
      },
      failure: (Failure<List<PreferenceModel>, CustomException> failure) {
        state = state.copyWith(
          getAllPreferencesStatus: Status.failure,
          getAllPreferencesException: failure.exception.model,
        );
      },
    );

    return state;
  }
}
