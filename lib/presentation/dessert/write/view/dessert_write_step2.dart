import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:go_router/go_router.dart';

class DessertWriteStep2 extends StatefulWidget {
  const DessertWriteStep2({required this.subject, super.key});

  final String subject;

  @override
  State<DessertWriteStep2> createState() => _DessertWriteStep2State();
}

class _DessertWriteStep2State extends State<DessertWriteStep2> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  bool isModifyActive = false;
  String modifiedSubject = '';
  bool isPersonActive = false;
  String personNumber = '';

  @override
  void initState() {
    super.initState();
    modifiedSubject = widget.subject;
    contentController.addListener(onContent);
  }

  void onContent() {
    setState(() {});
  }

  void _onSubmit() {
    print('dsfasdf => ${titleController.text}');
    print('dsfasdf => $modifiedSubject');
    print('dsfasdf => $personNumber');
    print('dsfasdf => ${contentController.text}');

    /// TODO: /api/app/mates 연결하기 FormData임
  }

  @override
  void dispose() {
    contentController.removeListener(onContent);
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TopBarIcon icon = TopBarIcon();

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (PointerDownEvent event) {
        setState(() {
          isModifyActive = false;
          isPersonActive = false;
        });
      },
      child: Scaffold(
        appBar: CustomSubTopBar(
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
          primary: false,
          title: '글쓰기',
          actions: <Widget>[
            CustomFillButton.medium(
              width: 70,
              label: '등록',
              backgroundColor: CustomFillButtonColor.olive,
              onPressed: _onSubmit,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                cursorColor: Colors.black,
                cursorWidth: 1,
                maxLength: 100,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '제목 (100자 이내)',
                  hintStyle: textTheme.titleMedium?.copyWith(
                    color: ScaleColorConfig.neutral50,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: ScaleColorConfig.neutral70),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: ScaleColorConfig.neutral70),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ScaleColorConfig.neutral70),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      '주제',
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.neutral40,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      modifiedSubject,
                      style: textTheme.bodyMedium?.copyWith(
                        color: ScaleColorConfig.neutral20,
                      ),
                    ),
                    const Spacer(),

                    PortalTarget(
                      portalFollower: CustomOptionMenuDropdown(
                        optionMenus: <CustomOptionMenu>[
                          CustomOptionMenu(
                            text: '친목도모☕',
                            onTap: () {
                              setState(() {
                                modifiedSubject = '친목도모☕';
                                isModifyActive = false;
                              });
                            },
                          ),
                          CustomOptionMenu(
                            text: '사진맛집📸',
                            onTap: () {
                              setState(() {
                                modifiedSubject = '사진맛집📸';
                                isModifyActive = false;
                              });
                            },
                          ),
                          CustomOptionMenu(
                            text: '카공모임🤓',
                            onTap: () {
                              setState(() {
                                modifiedSubject = '카공모임🤓';
                                isModifyActive = false;
                              });
                            },
                          ),
                          CustomOptionMenu(
                            text: '건강맛집🌱',
                            onTap: () {
                              setState(() {
                                modifiedSubject = '건강맛집🌱';
                                isModifyActive = false;
                              });
                            },
                          ),
                          CustomOptionMenu(
                            text: '빵지순례🍞',
                            onTap: () {
                              setState(() {
                                modifiedSubject = '빵지순례🍞';
                                isModifyActive = false;
                              });
                            },
                          ),
                          CustomOptionMenu(
                            text: '카페투어✈️',
                            onTap: () {
                              setState(() {
                                modifiedSubject = '카페투어✈️';
                              });
                            },
                          ),
                        ],
                      ),
                      visible: isModifyActive,
                      anchor: const Aligned(
                        follower: Alignment.topRight,
                        target: Alignment.bottomRight,
                      ),
                      child: CustomTextButton.underline(
                        label: '수정',
                        onPressed: () {
                          setState(() {
                            isModifyActive = !isModifyActive;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ScaleColorConfig.neutral70),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    PortalTarget(
                      portalFollower: Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: CustomOptionMenuDropdown(
                          optionMenus: <CustomOptionMenu>[
                            CustomOptionMenu(
                              text: '2명',
                              onTap: () {
                                setState(() {
                                  personNumber = '2명';
                                  isPersonActive = false;
                                });
                              },
                            ),
                            CustomOptionMenu(
                              text: '3명',
                              onTap: () {
                                setState(() {
                                  personNumber = '3명';
                                  isPersonActive = false;
                                });
                              },
                            ),
                            CustomOptionMenu(
                              text: '4명',
                              onTap: () {
                                setState(() {
                                  personNumber = '4명';
                                  isPersonActive = false;
                                });
                              },
                            ),
                            CustomOptionMenu(
                              text: '5명',
                              onTap: () {
                                setState(() {
                                  personNumber = '5명';
                                  isPersonActive = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      anchor: const Aligned(
                        follower: Alignment.topLeft,
                        target: Alignment.bottomLeft,
                      ),
                      visible: isPersonActive,
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                isPersonActive = !isPersonActive;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '인원',
                                  style: textTheme.titleSmall?.copyWith(
                                    color: ScaleColorConfig.neutral40,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                isPersonActive
                                    ? Assets.icon.etc.circleUp.svg()
                                    : Assets.icon.etc.circleDown.svg(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),

                    if (personNumber.isEmpty)
                      Text(
                        '함께할 인원을 선택해주세요',
                        style: textTheme.bodyMedium?.copyWith(
                          color: ScaleColorConfig.neutral50,
                        ),
                      )
                    else
                      Text(
                        personNumber,
                        style: textTheme.bodyMedium?.copyWith(
                          color: ScaleColorConfig.neutral20,
                        ),
                      ),
                  ],
                ),
              ),

              Stack(
                children: <Widget>[
                  TextField(
                    controller: contentController,
                    cursorColor: Colors.black,
                    cursorWidth: 1,
                    maxLength: 1000,
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: const EdgeInsets.all(16),
                      hintText: '원하는 디저트 메이트를 구해보세요 (1000자 이내)',
                      hintStyle: textTheme.bodyMedium?.copyWith(
                        color: ScaleColorConfig.neutral50,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ScaleColorConfig.neutral70,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ScaleColorConfig.neutral70,
                        ),
                      ),
                    ),
                    maxLines: 10,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 16,
                        bottom: 16,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: contentController.text.length.toString(),
                          style: textTheme.labelMedium?.copyWith(
                            color: const Color.fromRGBO(66, 66, 66, 1),
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '/1000',
                              style: textTheme.labelMedium?.copyWith(
                                color: ScaleColorConfig.neutral50,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
