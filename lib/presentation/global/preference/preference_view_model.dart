import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/usecase/preference/get_all_preferences_usecase.dart';

part 'generated/preference_view_model.freezed.dart';
part 'preference_state.dart';

/// 선호도 리스트는 계속 사용할 것이기 때문에 autoDispose 적용 X
final StateNotifierProvider<PreferenceViewModel, PreferenceState>
preferenceViewModelProvider =
    StateNotifierProvider<PreferenceViewModel, PreferenceState>(
      (Ref ref) => PreferenceViewModel(ref: ref),
    );

class PreferenceViewModel extends StateNotifier<PreferenceState> {
  PreferenceViewModel({required this.ref}) : super(const PreferenceState()) {
    getAllPreferences();
  }

  final Ref ref;

  /// 모든 선호도 조회
  Future<void> getAllPreferences() async {
    state = state.copyWith(status: Status.loading);

    final Result<List<PreferenceModel>, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(getAllPreferencesUsecaseProvider),
          params: NoParams(),
        );

    response.map(
      success: (Success<List<PreferenceModel>, CustomException> success) {
        state = state.copyWith(status: Status.success, data: success.data);
      },
      failure: (Failure<List<PreferenceModel>, CustomException> failure) {
        state = state.copyWith(
          status: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
