import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar_right_item.dart';
import 'package:frontend_mobile/common/design_system/foundation/font_weight/font_weight_config.dart';

/// Snack Bar
/// https://www.figma.com/design/Cmw8GLJYfuUVf9A3QNxqgW/SWYP_%EC%95%B1_1%EA%B8%B0_%EB%94%94%EC%A0%80%EB%B9%84?node-id=402-47680&t=5o43YjWL0f9qsQKt-4
class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    required this.description,
    this.duration = const Duration(seconds: 3),
    this.expanded = false,
    this.closeButton,
    this.actionButton,
    this.aboveBottomNavigation = false,
    super.key,
  });

  // 설명 텍스트
  final String description;

  // 표시 지속 시간 (기본 3초)
  final Duration duration;

  // 스낵바 확장 여부
  // true : 세로로 확장된 형태의 큰 스낵바
  // false : 세로로 확장되지 않은 형태의 작은 스낵바
  final bool expanded;

  // 우측 close item
  final SnackBarCloseButton? closeButton;

  // 우측 action item
  final SnackBarActionButton? actionButton;

  // 바텀 네브바 상단에 위치 여부
  final bool aboveBottomNavigation;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: colorScheme.inverseSurface,
        boxShadow: const <BoxShadow>[
          // TODO: 디자인 시스템 내 그림자 적용 필요
          BoxShadow(
            color: Color(0x4C282014),
            blurRadius: 5,
            offset: Offset(0, 3),
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0x26282014),
            blurRadius: 10,
            offset: Offset(0, 6),
            spreadRadius: 4,
          ),
        ],
      ),
      padding: EdgeInsets.zero,
      child: _getContentArea(context: context),
    );
  }

  Widget _getContentArea({required BuildContext context}) {
    // right item 사용 여부
    final bool hasRightItem = closeButton != null || actionButton != null;

    const TextStyle contentTextStyle = TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeightConfig.regular,
      color: Color(0xFFFAEFE2),
    );
    return expanded
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 14,
                bottom: hasRightItem ? 10 : 14,
              ),
              child: Text(
                description,
                style: contentTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (actionButton != null)
                  SizedBox(width: 64, height: 48, child: actionButton),
                if (closeButton != null)
                  SizedBox.square(dimension: 48, child: closeButton),
              ],
            ),
          ],
        )
        : Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: hasRightItem ? 4 : 8,
                  top: 14,
                  bottom: 14,
                ),
                child: Text(
                  description,
                  style: contentTextStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (hasRightItem)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: <Widget>[
                    if (actionButton != null)
                      SizedBox(width: 64, height: 48, child: actionButton),
                    if (closeButton != null)
                      SizedBox.square(dimension: 48, child: closeButton),
                  ],
                ),
              ),
          ],
        );
  }
}
