import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

final Provider<ToastManager> toastManagerProvider = Provider<ToastManager>((
  Ref ref,
) {
  // main.dart에서 override
  throw Exception();
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
  // Toast를 표시하고 싶은 Widget의 initState에서 반드시 호출
  void init({required BuildContext context}) {
    _fToast.init(context);
  }

  // Toast 표시
  void show({
    required Widget toastWidget,
    Duration duration = const Duration(seconds: 3),
  }) {
    // Custom Toast Position
    _fToast.showToast(
      child: toastWidget,
      toastDuration: duration,
      positionedToastBuilder: (
        BuildContext context,
        Widget child,
        ToastGravity? gravity,
      ) {
        return Positioned(right: 16.0, left: 16.0, bottom: 30, child: child);
      },
    );
  }

  // Toast 삭제
  void remove() {
    _fToast.removeCustomToast();
  }
}
