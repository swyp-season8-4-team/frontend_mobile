import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class DessertWriteStep1 extends StatefulWidget {
  const DessertWriteStep1({super.key});

  @override
  State<DessertWriteStep1> createState() => _DessertWriteStep1State();
}

class _DessertWriteStep1State extends State<DessertWriteStep1> {
  bool isNextButtonActivate = false;

  bool isGatheringSelected = false;
  bool isPhotoSelected = false;
  bool isStudySelected = false;
  bool isHealthSelected = false;
  bool isBreadSelected = false;
  bool isCafeSelected = false;

  void _resetHandler() {
    setState(() {
      isGatheringSelected = false;
      isPhotoSelected = false;
      isStudySelected = false;
      isHealthSelected = false;
      isBreadSelected = false;
      isCafeSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TopBarIcon icon = TopBarIcon();

    return Scaffold(
      appBar: CustomSubTopBar(
        title: '모임 생성',
        primary: false,
        leading: icon.close(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog.basic(
                  description: '아직 작성 중인 내용이 있어요.\n페이지를 나가시겠어요?',
                  primaryButton: CustomDialogButton(
                    text: '작성하기',
                    onTap: () {
                      context.pop(false);
                    },
                  ),
                  secondaryButton: CustomDialogButton(
                    text: '나가기',
                    onTap: () {
                      while (context.canPop()) {
                        context.pop();
                      }
                    },
                  ),
                );
              },
            );
          },
        ),
        actions: const <Widget>[],
      ),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 45, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '카테고리를 선택해주세요',
                style: textTheme.titleMedium?.copyWith(
                  color: ScaleColorConfig.neutral20,
                ),
              ),
              const SizedBox(height: 16),

              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomPillOutlineButton.small(
                      label: '친목도모☕️',
                      onPressed: () {
                        _resetHandler();

                        setState(() {
                          isGatheringSelected = true;
                          isNextButtonActivate = true;
                        });
                      },
                      isSelected: isGatheringSelected,
                    ),
                  ),
                  const SizedBox(width: 8),

                  Expanded(
                    child: CustomPillOutlineButton.small(
                      label: '사진맛집📸',
                      onPressed: () {
                        _resetHandler();

                        setState(() {
                          isPhotoSelected = true;
                          isNextButtonActivate = true;
                        });
                      },
                      isSelected: isPhotoSelected,
                    ),
                  ),
                  const SizedBox(width: 8),

                  Expanded(
                    child: CustomPillOutlineButton.small(
                      label: '카공모임🤓',
                      onPressed: () {
                        _resetHandler();

                        setState(() {
                          isStudySelected = true;
                          isNextButtonActivate = true;
                        });
                      },
                      isSelected: isStudySelected,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomPillOutlineButton.small(
                      label: '건강맛집🌱',
                      onPressed: () {
                        _resetHandler();

                        setState(() {
                          isHealthSelected = true;
                          isNextButtonActivate = true;
                        });
                      },
                      isSelected: isHealthSelected,
                    ),
                  ),
                  const SizedBox(width: 8),

                  Expanded(
                    child: CustomPillOutlineButton.small(
                      label: '빵지순례🍞',
                      onPressed: () {
                        _resetHandler();

                        setState(() {
                          isBreadSelected = true;
                          isNextButtonActivate = true;
                        });
                      },
                      isSelected: isBreadSelected,
                    ),
                  ),
                  const SizedBox(width: 8),

                  Expanded(
                    child: CustomPillOutlineButton.small(
                      label: '카페투어✈️',
                      onPressed: () {
                        _resetHandler();

                        setState(() {
                          isCafeSelected = true;
                          isNextButtonActivate = true;
                        });
                      },
                      isSelected: isCafeSelected,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              CustomFillButton.large(
                label: '다음',
                disabled: !isNextButtonActivate,
                onPressed: () {
                  String subject = '';

                  if (isGatheringSelected) {
                    subject = '친목도모☕️';
                  } else if (isPhotoSelected) {
                    subject = '사진맛집📸';
                  } else if (isStudySelected) {
                    subject = '카공모임🤓';
                  } else if (isHealthSelected) {
                    subject = '건강맛집🌱';
                  } else if (isBreadSelected) {
                    subject = '빵지순례🍞';
                  } else if (isCafeSelected) {
                    subject = '카페투어✈️';
                  }

                  context.pushNamed(
                    AppRoutes.dessertWriteStep2.name,
                    extra: subject,
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
