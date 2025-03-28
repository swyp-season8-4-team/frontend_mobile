import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomBottomSheet {
  CustomBottomSheet.middle({
    required BuildContext context,
    required Widget child,
    bool button = false,
  }) {
    _show(
      context: context,
      returnedFromBuilder: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _header(context: context),
            Container(
              height: 298,
              padding: const EdgeInsets.only(
                top: 10,
                right: 16,
                bottom: 16,
                left: 16,
              ),
              child: child,
            ),
            if (button)
              Container(
                height: 85,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: ScaleColorConfig.neutral50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // TODO: 버튼 컴포넌트 만들면 재적용할 예정
                    ElevatedButton(onPressed: () {}, child: const Text('Text')),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: const Text('Text')),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  CustomBottomSheet.short({
    required BuildContext context,
    required Widget child,
  }) {
    _show(
      context: context,
      returnedFromBuilder: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _header(context: context),
            Container(
              height: 134,
              padding: const EdgeInsets.all(10),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  /// showModalBottomSheet 호출하는 함수
  void _show({
    required BuildContext context,
    required Widget returnedFromBuilder,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ScaleColorConfig.white,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (BuildContext context) {
        return returnedFromBuilder;
      },
    );
  }

  /// Drag handle
  Widget _header({required BuildContext context}) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: 32,
        height: 4,
        decoration: BoxDecoration(
          // TODO: 컬러 정의 필요
          color: const Color(0xFF79747E),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
