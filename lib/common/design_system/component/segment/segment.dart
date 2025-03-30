import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomSegment extends StatelessWidget {
  const CustomSegment({required this.first, required this.second, super.key});

  final String first;
  final String second;

  BorderRadius get _borderRadius => BorderRadius.circular(6);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 2,
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: Material(
          color: ScaleColorConfig.neutral60,
          child: SizedBox(
            width: 208,
            child: IntrinsicHeight(
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                  // vertical: 18,
                ),
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: ScaleColorConfig.secondary40,
                  borderRadius: _borderRadius,
                ),
                labelStyle: textTheme.labelLarge?.copyWith(
                  color: ScaleColorConfig.neutral100,
                ),
                unselectedLabelStyle: textTheme.labelLarge?.copyWith(
                  color: ScaleColorConfig.neutral10,
                ),
                overlayColor: WidgetStateColor.resolveWith((
                  Set<WidgetState> states,
                ) {
                  return ScaleColorConfig.neutral50;
                }),
                splashBorderRadius: _borderRadius,
                tabs: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text(first)],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text(second)],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
