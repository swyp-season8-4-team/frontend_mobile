import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomProfilePhotoGenderOptionButton extends StatelessWidget {
  CustomProfilePhotoGenderOptionButton.girl({
    required this.onPressed,
    required this.isSelected,
    super.key,
  }) : label = '여자',
       image = Assets.image.profileGirl.image();

  CustomProfilePhotoGenderOptionButton.boy({
    required this.onPressed,
    required this.isSelected,
    super.key,
  }) : label = '남자',
       image = Assets.image.profileBoy.image();

  final String label;
  final Image image;
  final VoidCallback? onPressed;
  final bool isSelected;

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.surface80;
        }

        /// Selected
        if (isSelected) {
          return ScaleColorConfig.primary90;
        }

        /// Enabled
        return ScaleColorConfig.neutral100;
      });

  WidgetStateProperty<BorderSide> get _side =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return const BorderSide(color: ScaleColorConfig.neutral50);
        }

        /// Selected
        if (isSelected) {
          return const BorderSide(color: ScaleColorConfig.primary70);
        }

        /// Enabled
        return const BorderSide(color: ScaleColorConfig.neutral50);
      });

  /// TODO: textstyle 정의되면 적용
  TextStyle? get _textStyle => const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color.fromRGBO(57, 57, 57, 0.8),
  );

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 21),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        textStyle: textTheme.titleMedium,
      ).copyWith(backgroundColor: _backgroundColor, side: _side),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          image,
          const SizedBox(height: 6),
          Text(label, style: _textStyle),
        ],
      ),
    );
  }
}
