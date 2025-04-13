import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/progress_indicator/linear_progress_indicator.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/util/text_line_break.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/presentation/preference/preference_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/taste/my_taste_choice/my_taste_choice_view_model.dart';
import 'package:frontend_mobile/presentation/taste/my_taste_choice/widget/my_taste_wrapper.dart';
import 'package:frontend_mobile/presentation/taste/util/taste_skip_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class MyTasteChoiceStep4 extends ConsumerStatefulWidget {
  const MyTasteChoiceStep4({super.key});

  @override
  ConsumerState<MyTasteChoiceStep4> createState() => _MyTasteChoiceStep4State();
}

class _MyTasteChoiceStep4State extends ConsumerState<MyTasteChoiceStep4> {
  bool _disabled = true;

  bool _selected1 = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;

  final List<int> _selectedList = <int>[];
  int limitedId = -1;
  int localizingId = -1;
  int honeyId = -1;

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
  void initState() {
    super.initState();

    final PreferenceState state = ref.read(preferenceViewModelProvider);

    const PreferenceModel defaultModel = PreferenceModel(
      id: -1,
      preferenceName: '',
      preferenceDesc: '',
    );

    final PreferenceModel limited = state.data.firstWhere(
      (PreferenceModel element) =>
          element.preferenceDesc == '특정 시즌에만 나오는 시즌 디저트 🍧',
      orElse: () => defaultModel,
    );
    limitedId = limited.id;

    final PreferenceModel localizing = state.data.firstWhere(
      (PreferenceModel element) =>
          element.preferenceDesc == '여행 에서만 맛볼 수 있는 특별한 디저트 🍡',
      orElse: () => defaultModel,
    );
    localizingId = localizing.id;

    final PreferenceModel honey = state.data.firstWhere(
      (PreferenceModel element) =>
          element.preferenceDesc == "믿고 먹는 ‘크로플+아이스크림'과 같은 꿀조합 디저트 🧇",
      orElse: () => defaultModel,
    );
    honeyId = honey.id;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return CustomMyTasteWrapper(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 16),

          const CustomLinearProgressIndicator(currentValue: 4, maxValue: 4),
          const SizedBox(height: 17),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextLineBreak(
                    text: '디저트를 선택할 때 어떤 경험을 중요하게 생각하나요?',
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

                  CustomPillOutlineButton.medium(
                    label: '특정 시즌에만 나오는 시즌 디저트 🍧',
                    isSelected: _selected1,
                    onPressed: () {
                      setState(() {
                        _selected4 = false;
                        _selected1 = !_selected1;
                      });

                      _isDisabled();

                      if (_selectedList.contains(limitedId)) {
                        _selectedList.remove(limitedId);
                      } else {
                        _selectedList.add(limitedId);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomPillOutlineButton.medium(
                    label: '여행 에서만 맛볼 수 있는 특별한 디저트 🍡',
                    isSelected: _selected2,
                    onPressed: () {
                      setState(() {
                        _selected4 = false;
                        _selected2 = !_selected2;
                      });

                      _isDisabled();

                      if (_selectedList.contains(localizingId)) {
                        _selectedList.remove(localizingId);
                      } else {
                        _selectedList.add(localizingId);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomPillOutlineButton.medium(
                    label: "믿고 먹는 ‘크로플+아이스크림'과 같은 꿀조합 디저트 🧇",
                    isSelected: _selected3,
                    onPressed: () {
                      setState(() {
                        _selected4 = false;
                        _selected3 = !_selected3;
                      });

                      _isDisabled();

                      if (_selectedList.contains(honeyId)) {
                        _selectedList.remove(honeyId);
                      } else {
                        _selectedList.add(honeyId);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomPillOutlineButton.medium(
                    label: '특별히 중요하게 여기는 부분은 없어요 🙅',
                    isSelected: _selected4,
                    onPressed: () {
                      _unselectHandler();

                      setState(() {
                        _selected4 = true;
                      });

                      _isDisabled();

                      _selectedList.clear();
                    },
                  ),
                ],
              ),
            ),
          ),

          CustomFillButton.large(
            label: '결과보기',
            disabled: _disabled,
            onPressed: () {
              ref
                  .read(myTasteChoiceViewModelProvider.notifier)
                  .preferenceStep4(list: _selectedList);

              context.goNamed(AppRoutes.tasteResultLoading.name);
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
    );
  }
}
