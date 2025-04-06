import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomSnsLoginButton extends StatelessWidget {
  const CustomSnsLoginButton({
    required this.svgImage,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    this.width,
    super.key,
  });

  final SvgGenImage svgImage;
  final String label;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width ?? double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10.5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          textStyle: textTheme.titleMedium,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Text(label, textAlign: TextAlign.center),
            ),
            svgImage.svg(),
          ],
        ),
      ),
    );
  }
}
