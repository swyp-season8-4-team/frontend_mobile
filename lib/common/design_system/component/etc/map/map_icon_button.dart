import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

enum MapIconButtonType { filterReset, saveStore, myLocation }

/// Map Icon Button
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000687-146235&m=dev
class CustomMapIconButton extends StatefulWidget {
  CustomMapIconButton.filterReset({required this.onPressed, super.key})
    : isSelected = false,
      svg = Assets.icon.map.aiming2Line,
      disabled = false,
      iconColor = ScaleColorConfig.success50,
      type = MapIconButtonType.filterReset,
      selectedSvg = null;

  CustomMapIconButton.saveStore({
    required this.isSelected,
    required this.onPressed,
    this.disabled = false,
    super.key,
  }) : svg = Assets.icon.etc.flowerFilled,
       iconColor = null,
       type = MapIconButtonType.saveStore,
       selectedSvg = Assets.icon.etc.flowerFilledSelected;

  CustomMapIconButton.myLocation({
    required this.isSelected,
    required this.onPressed,
    this.disabled = false,
    super.key,
  }) : svg = Assets.icon.map.aiming2Line,
       iconColor = null,
       type = MapIconButtonType.myLocation,
       selectedSvg = null;
  final bool isSelected;
  final SvgGenImage svg;
  final SvgGenImage? selectedSvg;
  final VoidCallback onPressed;
  final Color? iconColor;
  final bool disabled;
  final MapIconButtonType type;

  @override
  State<CustomMapIconButton> createState() => _CustomMapIconButtonState();
}

class _CustomMapIconButtonState extends State<CustomMapIconButton> {
  Color? _iconColor;

  void _iconColorHandler({required Set<WidgetState> states}) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.type == MapIconButtonType.saveStore) {
          setState(() {
            _iconColor = null;
          });
        }

        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          setState(() {
            _iconColor = widget.iconColor ?? ScaleColorConfig.neutral40;
          });
          return;
        }

        /// Selected
        if (widget.isSelected) {
          setState(() {
            _iconColor = widget.iconColor ?? ScaleColorConfig.primary20;
          });
          return;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          setState(() {
            _iconColor = widget.iconColor ?? ScaleColorConfig.neutral40;
          });
          return;
        }

        /// Enabled
        setState(() {
          _iconColor = widget.iconColor ?? ScaleColorConfig.neutral40;
        });
      });

  WidgetStateProperty<Color?>? get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// 아이콘 색을 컨트롤하는 핸들러
        _iconColorHandler(states: states);

        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.neutral60;
        }

        /// Selected
        if (widget.isSelected) {
          return ScaleColorConfig.primary80;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return ScaleColorConfig.neutral50;
        }

        /// Enabled
        return ScaleColorConfig.neutral90;
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: ShadowConfig().level1,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: !widget.disabled ? widget.onPressed : null,
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
          minimumSize: Size.zero,
          padding: const EdgeInsets.all(4),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
        ).copyWith(backgroundColor: _backgroundColor),
        icon: Padding(
          padding: const EdgeInsets.all(4),
          child: SvgPicture.asset(
            (widget.isSelected && widget.type == MapIconButtonType.saveStore)
                ? widget.selectedSvg!.path
                : widget.svg.path,
            colorFilter:
                _iconColor == null
                    ? null
                    : ColorFilter.mode(_iconColor!, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
