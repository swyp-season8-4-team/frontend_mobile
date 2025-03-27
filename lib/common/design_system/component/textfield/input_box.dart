import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/font_weight/font_weight_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// Input Box
/// https://www.figma.com/design/Cmw8GLJYfuUVf9A3QNxqgW/SWYP_%EC%95%B1_1%EA%B8%B0_%EB%94%94%EC%A0%80%EB%B9%84?node-id=400-73177&t=3ArDzZQuJj0XGk5f-4
class CustomInputBox extends StatefulWidget {
  const CustomInputBox({
    this.label,
    super.key,
    this.visibility = true,
    this.visibilityControll = false,
    this.errorText,
    this.successText,
    this.onChanged,
    this.controller,
    this.hintText,
    this.inputFormatters,
    this.keyboardType,
    this.error = false,
    this.success = false,
    this.onCloseButtonTap,
    this.onVisibilityButtonTap,
  });
  final String? label;

  /// 글자 암호화 컨트롤 표시 여부
  final bool visibilityControll;

  /// 글자 암호화 여부
  final bool visibility;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  /// 에러 여부
  final bool error;
  final String? errorText;

  /// 성공 여부
  final bool success;
  final String? successText;
  final VoidCallback? onCloseButtonTap;
  final VoidCallback? onVisibilityButtonTap;
  @override
  State<CustomInputBox> createState() => _CustomInputBoxState();
}

class _CustomInputBoxState extends State<CustomInputBox> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final TextStyle labelTextStyle = TextStyle(
      fontWeight: FontWeightConfig.medium,
      fontSize: 14,
      height: 18 / 14,
      color: ScaleColorConfig.neutral30,
      letterSpacing: -0.28,
    );

    final TextStyle feedbackTextStyle = TextStyle(
      fontWeight: FontWeightConfig.regular,
      fontSize: 14,
      height: 17 / 14,
      color: ScaleColorConfig.error60,
      letterSpacing: -0.21,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(widget.label!, style: labelTextStyle),
          ),
        TextField(
          onChanged: widget.onChanged,
          onTapOutside: (_) {
            // 바깥 영역 터치시
            // 자동으로 unfocus
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: _textEditingController,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          style: textTheme.bodyMedium?.copyWith(
            color: ScaleColorConfig.neutral20,
          ),
          obscureText: !widget.visibility,
          // TODO: 컬러 시스템 값 적용 필요
          cursorColor: const Color(0xFF393939),
          cursorWidth: 1,
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            error: widget.error ? const SizedBox.shrink() : null,
            fillColor: ScaleColorConfig.neutral90,
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildCloseButton(),
                  _buildVisibilityOptionButton(),
                ],
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 13.5,
            ),
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
              borderSide: BorderSide(color: ScaleColorConfig.neutral30),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: colorScheme.error),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: colorScheme.error),
            ),
            hintText: widget.hintText,
            hintStyle: textTheme.bodyMedium?.copyWith(
              color: ScaleColorConfig.neutral50,
            ),
          ),
        ),
        if (widget.error && widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(widget.errorText!, style: feedbackTextStyle),
          )
        else if (widget.success && widget.successText != null)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              widget.successText!,
              style: feedbackTextStyle.copyWith(
                color: ScaleColorConfig.success60,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCloseButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        widget.onCloseButtonTap?.call();
        _textEditingController.clear();
      },
      child: Assets.icon.etc.a18CloseFilled.svg(),
    );
  }

  Widget _buildVisibilityOptionButton() {
    if (!widget.visibilityControll) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onVisibilityButtonTap,
        child:
            widget.visibility
                ? Assets.icon.etc.a18VisibilityOffOutlined.svg()
                : Assets.icon.etc.a18VisibilityOnOutlined.svg(),
      ),
    );
  }

  @override
  void dispose() {
    // 내부에서 생성한 컨트롤러인 경우, 내부에서 dispose
    if (_textEditingController != widget.controller) {
      _textEditingController.dispose();
    }
    super.dispose();
  }
}
