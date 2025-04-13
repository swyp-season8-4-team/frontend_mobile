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

class MyTasteChoiceStep1 extends StatefulWidget {
  const MyTasteChoiceStep1({super.key});

  @override
  State<MyTasteChoiceStep1> createState() => _MyTasteChoiceStep1State();
}

class _MyTasteChoiceStep1State extends State<MyTasteChoiceStep1> {
  bool _disabled = true;

  bool _selected1 = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;

  void _unselectHandler() {
    setState(() {
      _selected1 = false;
      _selected2 = false;
      _selected3 = false;
      _selected4 = false;
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

            const CustomLinearProgressIndicator(currentValue: 1, maxValue: 4),
            const SizedBox(height: 17),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextLineBreak(
                      text: '비건이나 글루텐 프리와 같은 건강한 디저트를 선호하나요?',
                      style: textTheme.titleLarge?.copyWith(
                        color: ScaleColorConfig.primary5,
                      ),
                    ),
                    const SizedBox(height: 48),

                    CustomPillOutlineButton.medium(
                      label: '비건 디저트 선호해요 👍',
                      isSelected: _selected1,
                      onPressed: () {
                        _unselectHandler();

                        setState(() {
                          _disabled = false;
                          _selected1 = true;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    CustomPillOutlineButton.medium(
                      label: '글루텐 프리 선호해요 💛',
                      isSelected: _selected2,
                      onPressed: () {
                        _unselectHandler();

                        setState(() {
                          _disabled = false;
                          _selected2 = true;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    CustomPillOutlineButton.medium(
                      label: '둘다 좋아요 🥳',
                      isSelected: _selected3,
                      onPressed: () {
                        _unselectHandler();

                        setState(() {
                          _disabled = false;
                          _selected3 = true;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    CustomPillOutlineButton.medium(
                      label: '잘 모르겠어요',
                      isSelected: _selected4,
                      onPressed: () {
                        _unselectHandler();

                        setState(() {
                          _disabled = false;
                          _selected4 = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            CustomFillButton.large(
              label: '다음',
              disabled: _disabled,
              onPressed: () {
                context.pushNamed(AppRoutes.myTasteChoiceStep2.name);
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
