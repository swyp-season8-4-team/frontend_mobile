import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// Search
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=401-73710&m=dev
class CustomSearch extends StatefulWidget {
  const CustomSearch({
    required this.onSubmitted,
    this.onChanged,
    this.controller,
    this.hintText = '검색어를 입력해주세요',
    this.inputFormatters,
    this.keyboardType,
    this.onCloseButtonTap,
    super.key,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;
  // 힌트 텍스트
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  // 지우기 이벤트 탭 이벤트 콜백
  final VoidCallback? onCloseButtonTap;
  // 텍스트 입력 완료 이벤트 콜백
  final void Function(String) onSubmitted;

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
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

    return TextField(
      onChanged: widget.onChanged,
      onTapOutside: (_) {
        // 바깥 영역 터치시
        // 자동으로 unfocus
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onSubmitted: widget.onSubmitted,
      controller: _textEditingController,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      // TODO: 컬러 시스템 값 적용 필요
      style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF393939)),
      // TODO: 컬러 시스템 값 적용 필요
      cursorColor: const Color(0xFF393939),
      cursorHeight: 17,
      cursorWidth: 1,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: ScaleColorConfig.neutral90,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              widget.onCloseButtonTap?.call();
              _textEditingController.clear();
            },
            child: Assets.icon.system.closeCircleFill.svg(
              width: 18,
              height: 18,
              colorFilter: ColorFilter.mode(
                ScaleColorConfig.neutral50,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          // 아이콘 너비 + 우측 패딩
          minWidth: 18 + 16,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 10),
          child: Assets.icon.file.search1Line.svg(
            colorFilter: ColorFilter.mode(
              ScaleColorConfig.neutral40,
              BlendMode.srcIn,
            ),
            fit: BoxFit.cover,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          // 아이콘 너비 + 좌측 패딩
          minWidth: 24 + 16,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12.5),
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
        hintText: widget.hintText,
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: ScaleColorConfig.neutral50,
        ),
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
