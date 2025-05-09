import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/radio/radio_button.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/text_field.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// 신고 사유 Item
class CustomReportedOptionItem extends StatefulWidget {
  // 기본 사유
  const CustomReportedOptionItem.basic({
    required this.label,
    required this.onTap,
    required this.selected,
    super.key,
  }) : hasOtherReason = false,
       controller = null,
       onTextChanged = null;

  // 기타 사유
  const CustomReportedOptionItem.otherReason({
    required this.label,
    required this.onTap,
    required this.selected,
    this.controller,
    this.onTextChanged,
    super.key,
  }) : hasOtherReason = true;

  // 신고 사유 내용
  final String label;
  // 탭 이벤트 콜백
  final VoidCallback onTap;
  // 신고 사유 선택 여부
  final bool selected;
  // 기타 사유 여부
  final bool hasOtherReason;
  final TextEditingController? controller;
  final void Function(String)? onTextChanged;

  @override
  State<CustomReportedOptionItem> createState() =>
      _CustomReportedOptionItemState();
}

class _CustomReportedOptionItemState extends State<CustomReportedOptionItem> {
  // 아이템 확장 여부
  bool _isExpanded = false;
  late final TextEditingController _textEditingController =
      widget.controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 18, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            widget.selected
                ? ScaleColorConfig.neutral100
                : ScaleColorConfig.neutral90,
        border: Border.all(
          color:
              widget.selected
                  ? ScaleColorConfig.primary40
                  : colorScheme.outline,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: CustomRadioButton.small(
                  label: widget.label,
                  onTap: widget.onTap,
                  value: widget.selected,
                ),
              ),
              if (widget.hasOtherReason)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child:
                        _isExpanded
                            ? Assets.icon.arrow.upLine.svg(
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                ScaleColorConfig.neutral40,
                                BlendMode.srcIn,
                              ),
                            )
                            : Assets.icon.arrow.downLine.svg(
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                ScaleColorConfig.neutral40,
                                BlendMode.srcIn,
                              ),
                            ),
                  ),
                ),
            ],
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.only(
                top: 14,
                left: 4,
                right: 4,
                bottom: 6,
              ),
              child: CustomTextField(
                controller: widget.controller ?? _textEditingController,
                onChanged: widget.onTextChanged,
                maxLength: 300,
                showCounter: false,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }
}
