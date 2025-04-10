import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/login_view_model.freezed.dart';
part 'login_state.dart';

final StateNotifierProvider<LoginViewModel, LoginState> loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>(
      (Ref ref) => LoginViewModel(),
    );

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel() : super(const LoginState());

  void login() {
    state = state.copyWith(isLoggedIn: true);
  }

  void logout() {
    state = state.copyWith(isLoggedIn: false);
  }
}
