import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class CustomExpandableText extends StatefulWidget {
  const CustomExpandableText({
    required this.text,
    required this.dateTime,
    super.key,
  });
  final String text;
  final DateTime dateTime;

  @override
  State<CustomExpandableText> createState() => _CustomExpandableTextState();
}

class _CustomExpandableTextState extends State<CustomExpandableText>
    with SingleTickerProviderStateMixin {
  bool _expanded = false; // 확장 상태 여부
  final int _maxLines = 4;
  String _displayedText = ''; // 표시될 텍스트
  double _maxWidth = 0; // LayoutBuilder에서 계산될 최대 너비
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ScaleColorConfig.surface80,
      ),
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (_maxWidth != constraints.maxWidth) {
                      _maxWidth = constraints.maxWidth;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _updateText();
                      });
                    }
                    return Text(
                      _displayedText,
                      style: textTheme.bodySmall?.copyWith(
                        color: ScaleColorConfig.neutral10,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      DateFormat('yyyy.MM.dd').format(widget.dateTime),
                      style: textTheme.labelSmall?.copyWith(
                        color: ScaleColorConfig.neutral40,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _toggleExpand();
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '더보기',
                            style: textTheme.labelSmall?.copyWith(
                              color: ScaleColorConfig.neutral40,
                            ),
                          ),
                          const SizedBox(width: 2),
                          _expanded
                              ? Assets.icon.etc.a14UpLineFilled.svg()
                              : Assets.icon.etc.a14DownLineFilled.svg(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateText() {
    final TextTheme textTheme = Theme.of(context).textTheme;

    // 확장된 상태일경우
    // 전체 텍스트 표시
    if (_expanded) {
      setState(() {
        _displayedText = widget.text;
      });
      return;
    }

    final TextPainter textPainter = TextPainter(
      textDirection: ui.TextDirection.ltr,
      text: TextSpan(
        text: widget.text,
        style: textTheme.bodySmall?.copyWith(color: ScaleColorConfig.neutral10),
      ),
    );

    textPainter.layout(maxWidth: _maxWidth);

    final List<ui.LineMetrics> lines = textPainter.computeLineMetrics();

    // 최대 줄 수 이하라면 원래 텍스트 표시
    if (lines.length <= _maxLines) {
      setState(() {
        _displayedText = widget.text;
      });
      return;
    }

    // 텍스트를 4줄까지만 표시하고 "..." 추가
    final int lastCharIndex =
        textPainter
            .getPositionForOffset(
              Offset(textPainter.width, lines[_maxLines - 1].baseline),
            )
            .offset;

    setState(() {
      _displayedText = '${widget.text.substring(0, lastCharIndex - 3)}...';
    });
  }

  // 텍스트 확장/축소 토글
  void _toggleExpand() {
    setState(() {
      _expanded = !_expanded;
      _updateText();
    });
  }
}
