import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:collection/collection.dart';

/// 버튼형 Input Box
/// https://www.figma.com/design/Cmw8GLJYfuUVf9A3QNxqgW/SWYP_%EC%95%B1_1%EA%B8%B0_%EB%94%94%EC%A0%80%EB%B9%84?node-id=400-73177&t=3ArDzZQuJj0XGk5f-4

enum ButtonInputType {
  // 주소 표시
  address,

  // 태그 표시
  tag,
}

class CustomButtonInputBox extends StatelessWidget {
  // 주소 표시용 버튼형 인풋 박스
  const CustomButtonInputBox.address({
    required this.onTap,
    this.label,
    this.hintText,
    this.text,
    super.key,
  }) : type = ButtonInputType.address,
       tags = null;

  // 태그 표시용 버튼형 인풋 박스
  const CustomButtonInputBox.tags({
    required this.onTap,
    this.label,
    this.hintText,
    this.tags,
    super.key,
  }) : type = ButtonInputType.tag,
       text = null;

  final String? label;
  final String? hintText;
  final List<String>? tags;
  final String? text;
  final ButtonInputType type;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label!,
              style: textTheme.titleSmall?.copyWith(
                color: ScaleColorConfig.neutral30,
              ),
            ),
          ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Container(
            padding: _getPadding(),
            decoration: BoxDecoration(
              color: ScaleColorConfig.neutral70,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: colorScheme.outline),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: _buildContent(context)),
                const SizedBox(width: 10),
                Assets.icon.arrow.rightLine.svg(
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(
                    ScaleColorConfig.neutral30,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  EdgeInsets _getPadding() {
    double horizontal;
    double vertical;

    if (type == ButtonInputType.tag) {
      if (tags != null) {
        horizontal = 16;
        vertical = 10.5;
      } else {
        horizontal = 16;
        vertical = 12.5;
      }
    }

    horizontal = 16;
    vertical = 12.5;

    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  Widget _buildContent(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (type == ButtonInputType.tag) {
      // 태그가 없는 경우
      // 자동으로 hint text 표시
      if (tags == null) {
        return Text(
          hintText ?? '',
          style: textTheme.bodyMedium?.copyWith(
            color: ScaleColorConfig.neutral30,
          ),
          overflow: TextOverflow.ellipsis,
        );
      }

      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // 태그를 배치 가능한 영역의 너비
          final double availableWidth = constraints.maxWidth - 40;

          // 사용중인 영역의 너비
          double usedWidth = 0;

          // 표시될 태그들
          final List<String> visibleTags = <String>[];

          // 숨겨진 태그들
          int hiddenCount = 0;

          for (String tag in tags!) {
            final double tagWidth = _calculateTextWidth(tag, context);
            if (usedWidth + tagWidth + 4 < availableWidth) {
              visibleTags.add(tag);
              usedWidth += (tagWidth + 4);
            } else {
              hiddenCount++;
            }
          }

          return Row(
            children: <Widget>[
              ...visibleTags.mapIndexed(
                (int index, String tag) => Padding(
                  padding: EdgeInsets.only(
                    right: index == visibleTags.length - 1 ? 0 : 4,
                  ),
                  child: _Tag(text: tag),
                ),
              ),

              const Spacer(),
              if (hiddenCount > 0)
                SizedBox(
                  width: 32,
                  child: Text(
                    '외 $hiddenCount개',
                    style: textTheme.labelLarge?.copyWith(
                      color: ScaleColorConfig.neutral40,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ),
            ],
          );
        },
      );
    }

    // 텍스트가 없는 경우
    // 자동으로 hint text 표시
    if (text == null) {
      return Text(
        hintText ?? '',
        overflow: TextOverflow.ellipsis,
        style: textTheme.bodyMedium?.copyWith(
          color: ScaleColorConfig.neutral50,
        ),
      );
    }

    return Text(
      text!,
      overflow: TextOverflow.ellipsis,
      style: textTheme.bodyMedium?.copyWith(color: ScaleColorConfig.neutral20),
    );
  }

  // 텍스트의 너비 계산
  double _calculateTextWidth(String text, BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: Theme.of(context).textTheme.labelLarge),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width + 16 + 0.6;
  }
}

// 버튼형 인풋 박스에 표시될 태그
class _Tag extends StatelessWidget {
  const _Tag({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        // TODO: 컬러 적용 필요
        border: Border.all(color: const Color(0xFF9F9F9F), width: 0.3),
        color: ScaleColorConfig.primary100,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        text,
        style: textTheme.labelLarge?.copyWith(
          color: ScaleColorConfig.neutral30,
        ),
      ),
    );
  }
}
