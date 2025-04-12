import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class BottomSheetButton {
  BottomSheetButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;
}

class CustomBottomSheet {
  CustomBottomSheet.middle({
    required this.context,
    required this.child,
    this.leftButton,
    this.rightButton,
    this.barrierColor,
  }) : height = 298,
       padding = const EdgeInsets.only(
         top: 10,
         right: 16,
         bottom: 16,
         left: 16,
       ),
       assert(
         leftButton == null || rightButton != null,
         'leftButton must be provided when rightButton is set',
       ),
       assert(
         rightButton == null || leftButton != null,
         'rightButton must be provided when leftButton is set',
       ) {
    _show();
  }

  CustomBottomSheet.short({
    required this.context,
    required this.child,
    this.leftButton,
    this.rightButton,
    this.barrierColor,
  }) : height = 134,
       padding = const EdgeInsets.all(10),
       assert(
         leftButton == null || rightButton != null,
         'leftButton must be provided when rightButton is set',
       ),
       assert(
         rightButton == null || leftButton != null,
         'rightButton must be provided when leftButton is set',
       ) {
    _show();
  }

  final BuildContext context;
  final Widget child;
  final double height;
  final EdgeInsets padding;
  final BottomSheetButton? rightButton;
  final BottomSheetButton? leftButton;
  final Color? barrierColor;

  void _show() {
    showModalBottomSheet(
      context: context,
      backgroundColor: ScaleColorConfig.white,
      barrierColor: barrierColor,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _header,
              Container(
                width: double.infinity,
                height: height,
                padding: padding,
                child: SingleChildScrollView(child: child),
              ),
              if (leftButton != null && rightButton != null) _button,
            ],
          ),
        );
      },
    );
  }

  /// Drag handle
  Widget get _header => Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Container(
      width: 32,
      height: 4,
      decoration: BoxDecoration(
        color: ScaleColorConfig.neutral30,
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );

  /// 하단 버튼들
  Widget get _button => Container(
    height: 85,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: ScaleColorConfig.neutral50)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: CustomOutlineButton(
            label: leftButton!.label,
            onPressed: leftButton!.onPressed,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomFillButton(
            label: rightButton!.label,
            onPressed: rightButton!.onPressed,
          ),
        ),
      ],
    ),
  );
}
