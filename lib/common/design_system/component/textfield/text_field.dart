import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/font_weight/font_weight_config.dart';

/// Text Field
/// https://www.figma.com/design/Cmw8GLJYfuUVf9A3QNxqgW/SWYP_%EC%95%B1_1%EA%B8%B0_%EB%94%94%EC%A0%80%EB%B9%84?node-id=400-73177&t=3ArDzZQuJj0XGk5f-4
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.profile,
    this.label,
    this.hintText = '내용을 입력해주세요',
    this.onChanged,
    this.maxLength = 60,
    this.controller,
    this.showCounter = true,
    super.key,
  });

  final Widget? profile;
  final String? label;
  final String hintText;
  final void Function(String)? onChanged;
  final int maxLength;
  final TextEditingController? controller;
  final bool showCounter;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    _textEditingController.addListener(_textEditingListener);
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle labelTextStyle = TextStyle(
      fontWeight: FontWeightConfig.medium,
      fontSize: 14,
      height: 18 / 14,
      color: ScaleColorConfig.neutral30,
      letterSpacing: -0.28,
    );

    const TextStyle hintTextStyle = TextStyle(
      color: ScaleColorConfig.neutral50,
      fontSize: 14,
      fontWeight: FontWeightConfig.regular,
      height: 20 / 14,
      letterSpacing: 0.25,
    );

    final TextTheme textTheme = Theme.of(context).textTheme;

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (widget.label != null)
                Expanded(child: Text(widget.label!, style: labelTextStyle)),

              if (widget.profile != null) ...<Widget>[
                widget.profile!,
                const Spacer(),
              ],

              // counter 표시
              if (widget.showCounter)
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: '${_textEditingController.text.length}',
                        style: textTheme.labelLarge?.copyWith(
                          color: ScaleColorConfig.neutral30,
                        ),
                      ),
                      TextSpan(
                        text: '/${widget.maxLength}',
                        style: textTheme.labelLarge?.copyWith(
                          color: ScaleColorConfig.neutral50,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
            ],
          ),
        ),
        TextField(
          controller: _textEditingController,
          onChanged: widget.onChanged,
          style: hintTextStyle.copyWith(color: ScaleColorConfig.neutral20),
          cursorWidth: 1,
          // TODO: 컬러 시스템 값 적용 필요
          cursorColor: const Color(0xFF393939),
          minLines: 5,
          maxLines: 5,
          maxLength: widget.maxLength,
          onTapOutside: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(12),
            hintText: widget.hintText,
            hintStyle: hintTextStyle,
            // counter를 커스텀하기위한 설정
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: colorScheme.outline),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: colorScheme.outline),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: ScaleColorConfig.neutral30),
            ),
          ),
        ),
      ],
    );
  }

  // 텍스트필드에 입력된 텍스트의 length를 갱신하기 위한 listener
  void _textEditingListener() {
    setState(() {});
  }

  @override
  void dispose() {
    // 내부에서 생성한 컨트롤러인 경우, 내부에서 dispose
    _textEditingController.removeListener(_textEditingListener);
    if (_textEditingController != widget.controller) {
      _textEditingController.dispose();
    }
    super.dispose();
  }
}
