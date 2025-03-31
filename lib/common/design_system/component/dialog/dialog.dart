import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

/// Dialog
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000088-62443&t=7TVdidIqbT7gZsMY-4
class CustomDialog extends StatelessWidget {
  const CustomDialog.basic({
    required this.description,
    this.title,
    this.onConfirmTap,
    super.key,
  });

  final String? title;
  final String description;
  final VoidCallback? onConfirmTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ScaleColorConfig.primary100,

            // TODO: shadow04 적용 필요
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0x4C282014),
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
              BoxShadow(
                color: Color(0x26282014),
                blurRadius: 10,
                offset: Offset(0, 6),
                spreadRadius: 4,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildContent(context),
              _buildDivider(context),
              _buildAction(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 5,
      width: size.width,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      ),
    );
  }

  Widget _buildAction(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed:
                onConfirmTap ??
                () {
                  Navigator.of(context).pop();
                },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.pressed)) {
                  return ScaleColorConfig.neutral80;
                }

                return ScaleColorConfig.neutral100;
              }),
              foregroundColor: const WidgetStatePropertyAll<Color>(
                ScaleColorConfig.success50,
              ),
              shape: const WidgetStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              shadowColor: const WidgetStatePropertyAll<Color>(
                Colors.transparent,
              ),
              overlayColor: const WidgetStatePropertyAll<Color>(
                Colors.transparent,
              ),
            ),
            child: Text(
              '확인',
              style: textTheme.titleMedium?.copyWith(
                color: ScaleColorConfig.success50,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      constraints: const BoxConstraints(minHeight: 118),
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                title!,
                style: textTheme.titleMedium?.copyWith(
                  // TODO: 타이포그래피 적용 필요
                  color: const Color(0xFF201B13),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          Text(
            description,
            style: textTheme.bodyLarge?.copyWith(
              color: ScaleColorConfig.neutral30,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
