import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_config.dart';

/// Dialog
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000088-62443&t=7TVdidIqbT7gZsMY-4

class CustomDialogButton {
  const CustomDialogButton({required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
}

class CustomDialog extends StatelessWidget {
  const CustomDialog.basic({
    required this.description,
    required this.primaryButton,
    this.title,
    this.footer,
    this.secondaryButton,
    super.key,
  });

  final String? title;
  final String description;
  final CustomDialogButton? footer;
  final CustomDialogButton primaryButton;
  final CustomDialogButton? secondaryButton;

  @override
  Widget build(BuildContext context) {
    final ShadowConfig shadow = ShadowConfig();
    return Align(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ScaleColorConfig.primary100,

                boxShadow: shadow.level4,
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
            if (footer != null) _buildFooter(context),
          ],
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          if (secondaryButton != null) ...<Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: secondaryButton!.onTap,
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
                    ScaleColorConfig.neutral40,
                  ),
                  shape: const WidgetStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
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
                  secondaryButton!.text,
                  style: textTheme.titleMedium?.copyWith(
                    color: ScaleColorConfig.neutral40,
                  ),
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: colorScheme.outlineVariant,
            ),
          ],
          Expanded(
            child: ElevatedButton(
              onPressed: primaryButton.onTap,
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
                shape: WidgetStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          secondaryButton != null
                              ? Radius.zero
                              : const Radius.circular(20),
                      bottomRight: const Radius.circular(20),
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
                primaryButton.text,
                style: textTheme.titleMedium?.copyWith(
                  color: ScaleColorConfig.success50,
                ),
              ),
            ),
          ),
        ],
      ),
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

  Widget _buildFooter(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: footer!.onTap,
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            footer!.text,
            style: textTheme.titleSmall?.copyWith(
              color: ScaleColorConfig.primary100,
              decoration: TextDecoration.underline,
              decorationColor: ScaleColorConfig.primary100,
              decorationThickness: 1,
            ),
          ),
        ),
      ),
    );
  }
}
