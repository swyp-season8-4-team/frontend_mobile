import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/my_taste_choice_view_model.freezed.dart';
part 'my_taste_choice_state.dart';

final StateNotifierProvider<MyTasteChoiceViewModel, MyTasteChoiceState>
myTasteChoiceViewModelProvider =
    StateNotifierProvider<MyTasteChoiceViewModel, MyTasteChoiceState>(
      (Ref ref) => MyTasteChoiceViewModel(ref: ref),
    );

class MyTasteChoiceViewModel extends StateNotifier<MyTasteChoiceState> {
  MyTasteChoiceViewModel({required this.ref})
    : super(const MyTasteChoiceState());

  final Ref ref;

  /// step1에서 고른 취향
  void preferenceStep1({required List<int> list}) {
    state = state.copyWith(preferenceStep1: list);
  }

  /// step2에서 고른 취향
  void preferenceStep2({required List<int> list}) {
    state = state.copyWith(preferenceStep2: list);
  }

  /// step3에서 고른 취향
  void preferenceStep3({required List<int> list}) {
    state = state.copyWith(preferenceStep3: list);
  }

  /// step4에서 고른 취향
  void preferenceStep4({required List<int> list}) {
    state = state.copyWith(preferenceStep4: list);
  }
}
