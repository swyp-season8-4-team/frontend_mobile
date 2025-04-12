import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/progress_indicator/linear_progress_indicator.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/util/text_line_break.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/taste/util/taste_skip_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class MyTasteChoiceStep2 extends StatefulWidget {
  const MyTasteChoiceStep2({super.key});

  @override
  State<MyTasteChoiceStep2> createState() => _MyTasteChoiceStep2State();
}

class _MyTasteChoiceStep2State extends State<MyTasteChoiceStep2> {
  bool _disabled = true;

  bool _selected1 = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;

  void _isDisabled() {
    if (_selected1 == false &&
        _selected2 == false &&
        _selected3 == false &&
        _selected4 == false) {
      setState(() {
        _disabled = true;
      });
    } else {
      setState(() {
        _disabled = false;
      });
    }
  }

  void _unselectHandler() {
    setState(() {
      _selected1 = false;
      _selected2 = false;
      _selected3 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomSubTopBar(
        title: '내 취향 설정',
        primary: false,
        actions: <Widget>[],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),

            const CustomLinearProgressIndicator(currentValue: 2, maxValue: 4),
            const SizedBox(height: 17),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextLineBreak(
                      text: '우유, 설탕 등 식이 제한이 있는 디저트를 선호하시나요?',
                      style: textTheme.titleLarge?.copyWith(
                        color: ScaleColorConfig.primary5,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Text(
                      '1~3개 선택',
                      style: textTheme.bodyMedium?.copyWith(
                        color: ScaleColorConfig.neutral30,
                      ),
                    ),
                    const SizedBox(height: 16),

                    CustomPillOutlineButton(
                      label: '유당불내증이 있어 우유를 피해요 🥛',
                      isSelected: _selected1,
                      onPressed: () {
                        setState(() {
                          _selected4 = false;
                          _selected1 = !_selected1;
                        });

                        _isDisabled();
                      },
                    ),
                    const SizedBox(height: 16),

                    CustomPillOutlineButton(
                      label: '설탕이 없는 로우슈가 제품을 선호해요 📉',
                      isSelected: _selected2,
                      onPressed: () {
                        setState(() {
                          _selected4 = false;
                          _selected2 = !_selected2;
                        });

                        _isDisabled();
                      },
                    ),
                    const SizedBox(height: 16),

                    CustomPillOutlineButton(
                      label: '키토제닉 디저트 좋아해요 🍞',
                      isSelected: _selected3,
                      onPressed: () {
                        setState(() {
                          _selected4 = false;
                          _selected3 = !_selected3;
                        });

                        _isDisabled();
                      },
                    ),
                    const SizedBox(height: 16),

                    CustomPillOutlineButton(
                      label: '특별한 식이 제한을 하지 않아요 🙅‍♀',
                      isSelected: _selected4,
                      onPressed: () {
                        _unselectHandler();

                        setState(() {
                          _selected4 = true;
                        });

                        _isDisabled();
                      },
                    ),
                  ],
                ),
              ),
            ),

            CustomFillButton(
              label: '다음',
              disabled: _disabled,
              onPressed: () {
                context.pushNamed(AppRoutes.myTasteChoiceStep3.name);
              },
            ),
            const SizedBox(height: 12),
            CustomTextButton(
              label: '건너뛰기',
              onPressed: () {
                tasteSkipBottomSheet(context: context, textTheme: textTheme);
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 30),
          ],
        ),
      ),
    );
  }
}
