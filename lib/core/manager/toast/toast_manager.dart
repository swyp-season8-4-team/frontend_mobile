import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

final Provider<ToastManager> toastManagerProvider = Provider<ToastManager>((
  Ref ref,
) {
  return ToastManager(fToast: FToast());
});

/// 토스트를 표시하고 제거하는 Manager
/// SnackBar는 이 Manager를 기반으로 표시/제거됨
class ToastManager {
  factory ToastManager({required FToast fToast}) {
    return _instance ??= ToastManager._internal(fToast: fToast);
  }
  ToastManager._internal({required FToast fToast}) : _fToast = fToast;

  static ToastManager? _instance;

  final FToast _fToast;

  // Toast 초기화
  void _init({required BuildContext context}) {
    _fToast.init(context);
  }

  // Toast 표시
  void show({
    required BuildContext context,
    required Widget toastWidget,

    // 바텀 네브바 상단에 표시 여부
    bool aboveBottomNavigation = false,

    // 지속시간 (기본 3초)
    Duration duration = const Duration(seconds: 3),
  }) {
    _init(context: context);

    _fToast.showToast(
      child: toastWidget,
      toastDuration: duration,
      positionedToastBuilder: (
        BuildContext context,
        Widget child,
        ToastGravity? gravity,
      ) {
        final double systemBottomPadding =
            MediaQuery.of(context).padding.bottom;
        return Positioned(
          right: 16.0,
          left: 16.0,
          bottom:
              aboveBottomNavigation
                  ? systemBottomPadding + 100
                  : systemBottomPadding + 30,
          child: child,
        );
      },
    );
  }

  // Toast 삭제
  void remove() {
    _fToast.removeCustomToast();
  }
}
