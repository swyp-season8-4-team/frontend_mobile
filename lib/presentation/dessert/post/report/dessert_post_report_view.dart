import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/component/radio/radio_button.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/text_field.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate/post_mate_report_params.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';
import 'package:frontend_mobile/presentation/dessert/post/report/dessert_post_report_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class DessertPostReportView extends ConsumerStatefulWidget {
  const DessertPostReportView({super.key});

  @override
  ConsumerState<DessertPostReportView> createState() =>
      _DessertPostReportViewState();
}

class _DessertPostReportViewState extends ConsumerState<DessertPostReportView> {
  bool isSelected = false;

  bool isSlangSelected = false;
  bool isExplicitSelected = false;
  bool isSpamSelected = false;
  bool isFakeSelected = false;
  bool isRepeatedSelected = false;

  bool isEtcSelected = false;
  bool isEtcArrowActive = false;
  final TextEditingController etcController = TextEditingController();

  @override
  void initState() {
    super.initState();
    etcController.addListener(onEtc);
  }

  void onEtc() {
    setState(() {
      if (etcController.text.length >= 10) {
        isSelected = true;
      }
    });
  }

  void unselectHandler() {
    setState(() {
      isSelected = false;

      isSlangSelected = false;
      isExplicitSelected = false;
      isSpamSelected = false;
      isFakeSelected = false;
      isRepeatedSelected = false;

      isEtcSelected = false;
      isEtcArrowActive = false;
      etcController.clear();
    });
  }

  Widget _postProfile({required MateDetailModel item}) {
    if (item.profileImage.isNotEmpty) {
      return Container(
        width: 24,
        height: 24,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),

        child: CachedNetworkImage(
          imageUrl: item.profileImage,
          fit: BoxFit.cover,
        ),
      );
    }

    return item.gender == 'MALE'
        ? CustomProfilePhotoSize.boy(size: CustomProfilePhotoSizeEnum.m)
        : CustomProfilePhotoSize.girl(size: CustomProfilePhotoSizeEnum.m);
  }

  void _onSubmit() {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);

    int reportCategoryId = -1;

    if (isSlangSelected) {
      reportCategoryId = 1;
    } else if (isExplicitSelected) {
      reportCategoryId = 2;
    } else if (isSpamSelected) {
      reportCategoryId = 3;
    } else if (isFakeSelected) {
      reportCategoryId = 4;
    } else if (isRepeatedSelected) {
      reportCategoryId = 5;
    } else if (isEtcSelected) {
      reportCategoryId = 6;
    }

    ref
        .read(dessertPostReportViewModelProvider.notifier)
        .postMateReport(
          params: PostMateReportParams(
            mateUuid: state.data.mateUuid,
            userUuid: ref.read(userViewModelProvider).data.userUuid,
            reportCategoryId: reportCategoryId,
            reportComment: reportCategoryId == 6 ? etcController.text : null,
          ),
        );
  }

  @override
  void dispose() {
    etcController.removeListener(onEtc);
    etcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DessertPostReportState state = ref.watch(
      dessertPostReportViewModelProvider,
    );
    final DessertPostState postState = ref.watch(dessertPostViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(dessertPostReportViewModelProvider, (
      _,
      DessertPostReportState next,
    ) {
      switch (next.status) {
        case Status.success:
          context.pushNamed(AppRoutes.dessertPostReportSuccess.name);
          break;

        case Status.failure:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception?.message ?? '',
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap:
                      next.exception?.code == 'ZZ003'
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

    return CustomLoadingOverlay(
      isLoading: state.status.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(
          title: '신고',
          primary: false,
          actions: <Widget>[],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      /// 댓글
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              color: ScaleColorConfig.neutral50,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                _postProfile(item: postState.data),
                                const SizedBox(width: 8),
                                Text(
                                  postState.data.nickname,
                                  style: textTheme.labelLarge?.copyWith(
                                    color: ScaleColorConfig.neutral10,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              postState.data.title,
                              style: textTheme.titleMedium?.copyWith(
                                color: ScaleColorConfig.neutral20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// 신고 유형 선택
                      Container(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '신고하는 이유를 선택해주세요',
                              style: textTheme.titleSmall?.copyWith(
                                color: ScaleColorConfig.primary10,
                              ),
                            ),
                            const SizedBox(height: 16),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ScaleColorConfig.neutral90,
                                border: Border.all(
                                  color: ScaleColorConfig.neutral50,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomRadioButton.small(
                                onTap: () {
                                  unselectHandler();

                                  setState(() {
                                    isSlangSelected = true;
                                    isSelected = true;
                                  });
                                },
                                value: isSlangSelected,
                                label: '욕설 또는 폭언',
                              ),
                            ),
                            const SizedBox(height: 12),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ScaleColorConfig.neutral90,
                                border: Border.all(
                                  color: ScaleColorConfig.neutral50,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomRadioButton.small(
                                onTap: () {
                                  unselectHandler();

                                  setState(() {
                                    isExplicitSelected = true;
                                    isSelected = true;
                                  });
                                },
                                value: isExplicitSelected,
                                label: '음란물 또는 부적절한 내용',
                              ),
                            ),
                            const SizedBox(height: 12),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ScaleColorConfig.neutral90,
                                border: Border.all(
                                  color: ScaleColorConfig.neutral50,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomRadioButton.small(
                                onTap: () {
                                  unselectHandler();

                                  setState(() {
                                    isSpamSelected = true;
                                    isSelected = true;
                                  });
                                },
                                value: isSpamSelected,
                                label: '광고 또는 스팸',
                              ),
                            ),
                            const SizedBox(height: 12),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ScaleColorConfig.neutral90,
                                border: Border.all(
                                  color: ScaleColorConfig.neutral50,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomRadioButton.small(
                                onTap: () {
                                  unselectHandler();

                                  setState(() {
                                    isFakeSelected = true;
                                    isSelected = true;
                                  });
                                },
                                value: isFakeSelected,
                                label: '허위 정보',
                              ),
                            ),
                            const SizedBox(height: 12),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ScaleColorConfig.neutral90,
                                border: Border.all(
                                  color: ScaleColorConfig.neutral50,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomRadioButton.small(
                                onTap: () {
                                  unselectHandler();

                                  setState(() {
                                    isRepeatedSelected = true;
                                    isSelected = true;
                                  });
                                },
                                value: isRepeatedSelected,
                                label: '게시물 도배',
                              ),
                            ),
                            const SizedBox(height: 12),

                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ScaleColorConfig.neutral90,
                                border: Border.all(
                                  color: ScaleColorConfig.neutral50,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: CustomRadioButton.small(
                                            onTap: () {
                                              unselectHandler();

                                              setState(() {
                                                isEtcSelected = true;
                                                isEtcArrowActive = true;
                                              });
                                            },
                                            value: isEtcSelected,
                                            label: '기타',
                                          ),
                                        ),

                                        if (isEtcArrowActive)
                                          Assets.icon.arrow.upLine.svg(
                                            width: 20,
                                            colorFilter: const ColorFilter.mode(
                                              ScaleColorConfig.neutral40,
                                              BlendMode.srcIn,
                                            ),
                                          )
                                        else
                                          Assets.icon.arrow.downLine.svg(
                                            width: 20,
                                            colorFilter: const ColorFilter.mode(
                                              ScaleColorConfig.neutral40,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),

                                  if (isEtcArrowActive) ...<Widget>[
                                    const SizedBox(height: 12),
                                    CustomTextField(
                                      controller: etcController,
                                      hintText: '사유를 10자 이상 작성해주세요.',
                                      showCounter: false,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: CustomFillButton.large(
                  label: '제출하기',
                  disabled: !isSelected,
                  onPressed: _onSubmit,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
