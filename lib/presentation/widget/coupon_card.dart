import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// 쿠폰 UI
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000961-217971&m=dev
class CouponCard extends StatelessWidget {
  const CouponCard({
    required this.title,
    required this.description,
    required this.issued,
    required this.onIssueTap,
    super.key,
  });
  final String title;
  final String description;

  // 발급 여부
  final bool issued;

  // 발급 버튼 클릭 이벤트 콜백
  final VoidCallback onIssueTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 54,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: colorScheme.outline),
        color:
            issued ? ScaleColorConfig.neutral80 : ScaleColorConfig.neutral100,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 8,
            height: 54,
            color:
                issued
                    ? ScaleColorConfig.neutral50
                    : ScaleColorConfig.primary80,
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: textTheme.titleSmall?.copyWith(
                      color: ScaleColorConfig.primary10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    description,
                    style: textTheme.labelSmall?.copyWith(
                      color: ScaleColorConfig.neutral40,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),

          // 구분선 + 아이콘
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (!issued) {
                onIssueTap();
              }
            },
            child: DottedBorder(
              color: colorScheme.outline,
              padding: EdgeInsets.zero,
              customPath: (Size size) {
                return Path()
                  ..moveTo(0, 0)
                  ..lineTo(0, size.height);
              },
              child: SizedBox(
                width: 46,
                height: 54,
                child: Center(
                  child:
                      issued
                          ? Text(
                            '다운완료',
                            style: textTheme.labelSmall?.copyWith(
                              color: ScaleColorConfig.neutral40,
                            ),
                          )
                          : Assets.icon.file.download2Line.svg(
                            width: 14,
                            height: 14,
                            colorFilter: const ColorFilter.mode(
                              ScaleColorConfig.primary50,
                              BlendMode.srcIn,
                            ),
                          ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
