import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/progress_indicator/linear_progress_indicator.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/util/text_line_break.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/presentation/global/preference/preference_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/taste/my_taste_choice/my_taste_choice_view_model.dart';
import 'package:frontend_mobile/presentation/taste/my_taste_choice/widget/my_taste_wrapper.dart';
import 'package:frontend_mobile/presentation/taste/util/taste_skip_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class MyTasteChoiceStep2 extends ConsumerStatefulWidget {
  const MyTasteChoiceStep2({super.key});

  @override
  ConsumerState<MyTasteChoiceStep2> createState() => _MyTasteChoiceStep2State();
}

class _MyTasteChoiceStep2State extends ConsumerState<MyTasteChoiceStep2> {
  bool _disabled = true;

  bool _selected1 = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;

  final List<int> _selectedList = <int>[];
  int lactoseId = -1;
  int lowSugarId = -1;
  int ketogenicId = -1;

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

    final PreferenceModel lactose = state.data.firstWhere(
      (PreferenceModel element) =>
          element.preferenceDesc == '유당불내증이 있어 우유를 피해요 🥛',
      orElse: () => defaultModel,
    );
    lactoseId = lactose.id;

    final PreferenceModel lowSugar = state.data.firstWhere(
      (PreferenceModel element) =>
          element.preferenceDesc == '설탕이 없는 로우슈가 제품을 선호해요 📉',
      orElse: () => defaultModel,
    );
    lowSugarId = lowSugar.id;

    final PreferenceModel ketogenic = state.data.firstWhere(
      (PreferenceModel element) => element.preferenceDesc == '키토제닉 디저트 좋아해요 🍞',
      orElse: () => defaultModel,
    );
    ketogenicId = ketogenic.id;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return CustomMyTasteWrapper(
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

                  CustomPillOutlineButton.medium(
                    label: '유당불내증이 있어 우유를 피해요 🥛',
                    isSelected: _selected1,
                    onPressed: () {
                      setState(() {
                        _selected4 = false;
                        _selected1 = !_selected1;
                      });

                      _isDisabled();

                      if (_selectedList.contains(lactoseId)) {
                        _selectedList.remove(lactoseId);
                      } else {
                        _selectedList.add(lactoseId);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomPillOutlineButton.medium(
                    label: '설탕이 없는 로우슈가 제품을 선호해요 📉',
                    isSelected: _selected2,
                    onPressed: () {
                      setState(() {
                        _selected4 = false;
                        _selected2 = !_selected2;
                      });

                      _isDisabled();

                      if (_selectedList.contains(lowSugarId)) {
                        _selectedList.remove(lowSugarId);
                      } else {
                        _selectedList.add(lowSugarId);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomPillOutlineButton.medium(
                    label: '키토제닉 디저트 좋아해요 🍞',
                    isSelected: _selected3,
                    onPressed: () {
                      setState(() {
                        _selected4 = false;
                        _selected3 = !_selected3;
                      });

                      _isDisabled();

                      if (_selectedList.contains(ketogenicId)) {
                        _selectedList.remove(ketogenicId);
                      } else {
                        _selectedList.add(ketogenicId);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomPillOutlineButton.medium(
                    label: '특별한 식이 제한을 하지 않아요 🙅‍♀',
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
            label: '다음',
            disabled: _disabled,
            onPressed: () {
              ref
                  .read(myTasteChoiceViewModelProvider.notifier)
                  .preferenceStep2(list: _selectedList);

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
    );
  }
}
