import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// Radio Button
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=404-36845&m=dev
class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({
    required this.onTap,
    this.value = false,
    this.enabled = true,
    this.label,
    super.key,
  });
  final String? label;
  final bool value;
  final VoidCallback onTap;
  final bool enabled;

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: widget.enabled ? widget.onTap : null,
          onTapDown: widget.enabled ? (_) => _setPressed() : null,
          onTapUp: widget.enabled ? (_) => _unsetPressed() : null,
          onTapCancel: widget.enabled ? _unsetPressed : null,
          child: SizedBox.square(
            dimension: 48,
            child: Center(child: _buildIcon()),
          ),
        ),
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(left: 2),

            // TODO: 타이포그래피 적용 필요
            child: Text(
              widget.label!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.36,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildIcon() {
    if (widget.enabled) {
      if (widget.value && !_pressed) {
        return Assets.icon.etc.radioButtonChecked.svg();
      } else if (widget.value && _pressed) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ScaleColorConfig.secondary60,
          ),
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: Assets.icon.etc.radioButtonChecked.svg(),
        );
      } else if (!widget.value && !_pressed) {
        return Assets.icon.etc.radioButtonUnchecked.svg();
      } else {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ScaleColorConfig.secondary60,
          ),
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: Assets.icon.etc.radioButtonUnchecked.svg(),
        );
      }
    }

    if (widget.value) {
      return Assets.icon.etc.radioButtonCheckedDisabled.svg();
    }

    return Assets.icon.etc.radioButtonUncheckedDisabled.svg();
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
