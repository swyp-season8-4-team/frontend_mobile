import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/param/mate/patch_mate_params.dart';
import 'package:frontend_mobile/presentation/dessert/modify/dessert_modify_view_model.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class DessertModifyStep2 extends ConsumerStatefulWidget {
  const DessertModifyStep2({required this.subject, super.key});

  final String subject;

  @override
  ConsumerState<DessertModifyStep2> createState() => _DessertModifyStep2State();
}

class _DessertModifyStep2State extends ConsumerState<DessertModifyStep2> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  bool isPersonActive = false;
  int personNumber = -1;

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    titleController.addListener(onTitle);
    contentController.addListener(onContent);

    final DessertPostState state = ref.read(dessertPostViewModelProvider);
    titleController.text = state.data.title;
    contentController.text = state.data.content;
    personNumber = state.data.capacity;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await downloadImageToFile();
    });
  }

  void onTitle() {
    setState(() {});
  }

  void onContent() {
    setState(() {});
  }

  Future<void> downloadImageToFile() async {
    final DessertPostState state = ref.read(dessertPostViewModelProvider);
    final String imageUrl = state.data.mateImage;

    if (imageUrl.isNotEmpty) {
      final Directory tempDir = await getTemporaryDirectory();
      final String filePath = '${tempDir.path}/${DateTime.now()}.png';

      final Dio dio = Dio();
      await dio.download(
        imageUrl,
        filePath,
        options: Options(responseType: ResponseType.bytes),
      );

      _imageFile = File(filePath);
      setState(() {});
    }
  }

  void _onSubmit() async {
    FocusScope.of(context).requestFocus(FocusNode());

    int mateCategoryId = -1;

    switch (widget.subject) {
      case '친목도모☕️':
        mateCategoryId = 1;
        break;

      case '사진맛집📸':
        mateCategoryId = 2;
        break;

      case '카공모임🤓':
        mateCategoryId = 3;
        break;

      case '건강맛집🌱':
        mateCategoryId = 4;
        break;

      case '빵지순례🍞':
        mateCategoryId = 5;
        break;

      case '카페투어✈️':
        mateCategoryId = 6;
        break;
    }

    MultipartFile? mateImage;
    if (_imageFile != null) {
      mateImage = await MultipartFile.fromFile(
        _imageFile!.path,
        filename: '${DateTime.now()}.png',
        contentType: DioMediaType('image', 'png'),
      );
    }

    if (context.mounted) {
      final DessertPostState postState = ref.read(dessertPostViewModelProvider);

      await ref
          .read(dessertModifyViewModelProvider.notifier)
          .patchMate(
            params: PatchMateParams(
              mateUuid: postState.data.mateUuid,
              userUuid: ref.read(userViewModelProvider).data.userUuid,
              mateCategoryId: mateCategoryId,
              capacity: personNumber,
              title: titleController.text,
              content: contentController.text,
              mateImage: mateImage,
              recruitYn: true,
            ),
          );
    }
  }

  void _pickImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        _imageFile = File(file.path);
      });
    }
  }

  @override
  void dispose() {
    titleController.removeListener(onTitle);
    contentController.removeListener(onContent);
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DessertModifyState modifyState = ref.watch(
      dessertModifyViewModelProvider,
    );
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TopBarIcon icon = TopBarIcon();

    ref.listen(dessertModifyViewModelProvider, (
      _,
      DessertModifyState next,
    ) async {
      switch (next.patchMateStatus) {
        case Status.success:
          context.pop();
          context.pop();
          break;

        case Status.failure:
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception.message,
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap:
                      next.exception.code == 'ZZ003'
                          ? () => context.goNamed(AppRoutes.localLogin.name)
                          : () => context.pop(),
                ),
              );
            },
          );
          break;

        default:
      }
    });

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (PointerDownEvent event) {
        setState(() {
          isPersonActive = false;
        });
      },
      child: CustomLoadingOverlay(
        isLoading: modifyState.patchMateStatus.isLoading,
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
                          context.pop();
                          context.pop();
                          context.pop();
                        },
                      ),
                    );
                  },
                );
              },
            ),
            primary: false,
            title: '작성글 수정',
            actions: <Widget>[
              CustomFillButton.medium(
                width: 70,
                disabled:
                    titleController.text.isEmpty ||
                    personNumber == -1 ||
                    contentController.text.isEmpty,
                label: '수정',
                backgroundColor: CustomFillButtonColor.olive,
                onPressed: _onSubmit,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                /// 제목
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

                /// 주제
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
                        widget.subject,
                        style: textTheme.bodyMedium?.copyWith(
                          color: ScaleColorConfig.neutral20,
                        ),
                      ),
                      const Spacer(),
                      CustomTextButton.underline(
                        label: '수정',
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ],
                  ),
                ),

                /// 인원
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
                                    personNumber = 2;
                                    isPersonActive = false;
                                  });
                                },
                              ),
                              CustomOptionMenu(
                                text: '3명',
                                onTap: () {
                                  setState(() {
                                    personNumber = 3;
                                    isPersonActive = false;
                                  });
                                },
                              ),
                              CustomOptionMenu(
                                text: '4명',
                                onTap: () {
                                  setState(() {
                                    personNumber = 4;
                                    isPersonActive = false;
                                  });
                                },
                              ),
                              CustomOptionMenu(
                                text: '5명',
                                onTap: () {
                                  setState(() {
                                    personNumber = 5;
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

                      if (personNumber == -1)
                        Text(
                          '함께할 인원을 선택해주세요',
                          style: textTheme.bodyMedium?.copyWith(
                            color: ScaleColorConfig.neutral50,
                          ),
                        )
                      else
                        Text(
                          '$personNumber명',
                          style: textTheme.bodyMedium?.copyWith(
                            color: ScaleColorConfig.neutral20,
                          ),
                        ),
                    ],
                  ),
                ),

                /// 텍스트 필드
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: ScaleColorConfig.neutral70),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      /// 이미지
                      if (_imageFile != null) ...<Widget>[
                        Stack(
                          children: <Widget>[
                            Image.file(_imageFile!, width: double.infinity),

                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomDialog.basic(
                                        description: '첨부한 사진을 삭제 하시겠어요?',
                                        primaryButton: CustomDialogButton(
                                          text: '삭제',
                                          onTap: () {
                                            setState(() {
                                              _imageFile = null;
                                            });
                                            context.pop();
                                          },
                                        ),
                                        secondaryButton: CustomDialogButton(
                                          text: '취소',
                                          onTap: () {
                                            context.pop();
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                      255,
                                      255,
                                      255,
                                      0.8,
                                    ),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Assets.icon.system.closeLine.svg(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],

                      /// 텍스트
                      TextField(
                        controller: contentController,
                        cursorColor: Colors.black,
                        cursorWidth: 1,
                        maxLength: 1000,

                        decoration: InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.zero,
                          hintText: '원하는 디저트 메이트를 구해보세요 (1000자 이내)',
                          hintStyle: textTheme.bodyMedium?.copyWith(
                            color: ScaleColorConfig.neutral50,
                          ),
                          border: InputBorder.none,
                        ),
                        maxLines: 10,
                      ),

                      /// 글자수
                      SizedBox(
                        width: double.infinity,
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
                    ],
                  ),
                ),

                /// 사진, 키보드
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: ScaleColorConfig.neutral70),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: _imageFile == null ? () => _pickImage() : null,
                        child: Assets.icon.file.picLine.svg(
                          colorFilter: ColorFilter.mode(
                            _imageFile == null
                                ? ScaleColorConfig.neutral40
                                : ScaleColorConfig.neutral70,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),

                      /// 키보드가 열렸는지 확인
                      if (MediaQuery.of(context).viewInsets.bottom > 0)
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: Assets.icon.system.keyboardDown1Line.svg(
                            colorFilter: const ColorFilter.mode(
                              ScaleColorConfig.neutral40,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
