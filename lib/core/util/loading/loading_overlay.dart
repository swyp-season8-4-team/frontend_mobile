import 'package:flutter/material.dart';
import 'package:frontend_mobile/core/util/loading/global_loading_overlay.dart';

/// GlobalLoadingOverlay는 위젯 트리 최상단에서 실행됨
class CustomLoadingOverlay extends StatelessWidget {
  const CustomLoadingOverlay({
    required this.child,
    required this.isLoading,
    super.key,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isLoading) {
        GlobalLoadingOverlay().show(context: context);
      } else {
        GlobalLoadingOverlay().hide();
      }
    });

    return child;
  }
}
