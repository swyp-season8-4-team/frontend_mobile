import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// Checkbox
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=511-41479&m=dev
class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    required this.onTap,
    this.value = false,
    this.enabled = true,
    this.label,
    super.key,
  });

  final String? label;

  // 라디오 버튼 체크 여부
  final bool value;

  // 라디오 버튼 클릭 이벤트 콜백
  final VoidCallback onTap;

  // enabled 여부
  final bool enabled;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.enabled ? widget.onTap : null,
      onTapDown: widget.enabled ? (_) => _setPressed() : null,
      onTapUp: widget.enabled ? (_) => _unsetPressed() : null,
      onTapCancel: widget.enabled ? _unsetPressed : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildIcon(),
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(left: 2),

              // TODO: 타이포그래피 적용 필요
              child: Text(
                widget.label!,
                style: TextStyle(
                  color:
                      widget.enabled
                          ? Colors.black
                          : ScaleColorConfig.neutral50,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.36,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    if (widget.enabled) {
      if (widget.value && !_pressed) {
        return Assets.icon.etc.a48CheckboxChecked.svg();
      } else if (widget.value && _pressed) {
        return Assets.icon.etc.a48CheckboxCheckedPressed.svg();
      } else if (!widget.value && !_pressed) {
        return Assets.icon.etc.a48CheckboxUnchecked.svg();
      } else {
        return Assets.icon.etc.a48CheckboxUncheckedPressed.svg();
      }
    }

    if (widget.value) {
      return Assets.icon.etc.a48CheckboxCheckedDisabled.svg();
    }

    return Assets.icon.etc.a48CheckboxUncheckedDisabled.svg();
  }

  void _setPressed() {
    setState(() {
      _pressed = true;
    });
  }

  void _unsetPressed() {
    setState(() {
      _pressed = false;
    });
  }
}
