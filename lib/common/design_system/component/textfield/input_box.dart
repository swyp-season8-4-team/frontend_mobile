import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/font_weight/font_weight_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:intl/intl.dart';

/// Input Box
/// https://www.figma.com/design/Cmw8GLJYfuUVf9A3QNxqgW/SWYP_%EC%95%B1_1%EA%B8%B0_%EB%94%94%EC%A0%80%EB%B9%84?node-id=400-73177&t=3ArDzZQuJj0XGk5f-4

class CustomInputBox extends StatefulWidget {
  const CustomInputBox({
    this.label,
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
    this.closeControll = false,
    this.onCloseButtonTap,
    this.onVisibilityButtonTap,
    this.maxLength,
    this.useTimer = false,
    this.startSeconds,
    super.key,
  });

  // 라벨
  final String? label;
  // 글자 암호화 컨트롤 표시 여부
  final bool visibilityControll;
  // 글자 암호화 여부
  final bool visibility;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  // 힌트 텍스트
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  // 에러 여부
  final bool error;
  final String? errorText;
  // 성공 여부
  final bool success;
  final String? successText;
  // 지우기 컨트롤 표시 여부
  final bool closeControll;
  // 지우기 이벤트 탭 이벤트 콜백
  final VoidCallback? onCloseButtonTap;
  // 텍스트 암호화 탭 이벤트 이벤트 콜백
  final VoidCallback? onVisibilityButtonTap;
  // 타이머 사용 여부
  final bool useTimer;
  // 타이머 시작 시간
  final int? startSeconds;

  final int? maxLength;
  @override
  State<CustomInputBox> createState() => _CustomInputBoxState();
}

class _CustomInputBoxState extends State<CustomInputBox> {
  late final TextEditingController _textEditingController;

  int _startSeconds = -1;
  Timer? _timer;

  bool get _hasSuffix =>
      widget.closeControll || widget.visibilityControll || widget.useTimer;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();

    if (widget.startSeconds != null) {
      _startSeconds = widget.startSeconds!;
    }

    if (widget.useTimer) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_startSeconds > 0) {
        setState(() {
          _startSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formattedTime({required int seconds}) {
    final Duration duration = Duration(seconds: seconds);
    final DateFormat formatter = DateFormat('mm:ss');
    final DateTime time = DateTime.utc(0).add(duration);
    return formatter.format(time);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    const TextStyle labelTextStyle = TextStyle(
      fontWeight: FontWeightConfig.medium,
      fontSize: 14,
      height: 18 / 14,
      color: ScaleColorConfig.neutral30,
      letterSpacing: -0.28,
    );

    const TextStyle feedbackTextStyle = TextStyle(
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
          maxLength: widget.maxLength,
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
            suffixIcon:
                _hasSuffix
                    ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          _buildTimer(),
                          _buildCloseButton(),
                          _buildVisibilityOptionButton(),
                        ],
                      ),
                    )
                    : null,
            suffixIconConstraints:
                _hasSuffix
                    ? const BoxConstraints(
                      // 아이콘 너비 + 왼쪽 패딩
                      minWidth: 18 + 16,
                    )
                    : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12.5,
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
              borderSide: const BorderSide(color: ScaleColorConfig.neutral30),
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
            counterText: '',
          ),
        ),
        if (widget.error &&
            widget.errorText != null &&
            widget.errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: <Widget>[
                Assets.icon.system.a16WarningCircleFilled.svg(),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(widget.errorText!, style: feedbackTextStyle),
                ),
              ],
            ),
          )
        else if (widget.success && widget.successText != null)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: <Widget>[
                Assets.icon.system.a16CheckCircleFilled.svg(),
                const SizedBox(width: 5),

                Expanded(
                  child: Text(
                    widget.successText!,
                    style: feedbackTextStyle.copyWith(
                      color: ScaleColorConfig.success60,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildTimer() {
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (!widget.useTimer) {
      return const SizedBox.shrink();
    }

    return Text(
      _formattedTime(seconds: _startSeconds),
      style: textTheme.bodySmall?.copyWith(color: ScaleColorConfig.error60),
    );
  }

  Widget _buildCloseButton() {
    if (_textEditingController.text.isEmpty) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        widget.onCloseButtonTap?.call();
        _textEditingController.clear();
      },
      child: Row(
        children: <Widget>[
          if (widget.useTimer) const SizedBox(width: 10),
          Assets.icon.etc.a18CloseCircleFilledEnabled.svg(),
        ],
      ),
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
                ? Assets.icon.etc.a18OpenEyeOutlined.svg()
                : Assets.icon.etc.a18CloseEyeOutlined.svg(),
      ),
    );
  }

  @override
  void dispose() {
    // 내부에서 생성한 컨트롤러인 경우, 내부에서 dispose
    if (_textEditingController != widget.controller) {
      _textEditingController.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }
}
