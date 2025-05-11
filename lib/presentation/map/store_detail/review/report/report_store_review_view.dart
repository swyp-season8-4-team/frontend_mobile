import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/etc/reported_option_item.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar_right_item.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/map/store_detail/review/report/report_store_review_view_model.dart';
import 'package:frontend_mobile/presentation/map/store_detail/store_detail_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class ReportStoreReviewView extends ConsumerStatefulWidget {
  const ReportStoreReviewView({
    required this.storeUuid,
    required this.reviewUuid,
    super.key,
  });
  final String storeUuid;
  final String reviewUuid;

  @override
  ConsumerState<ReportStoreReviewView> createState() =>
      _ReportReviewViewState();
}

class _ReportReviewViewState extends ConsumerState<ReportStoreReviewView> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final StoreDetailState storeDetailState = ref.watch(
      storeDetailViewModelProvider,
    );
    final ReportStoreReviewState state = ref.watch(
      reportStoreReviewViewModelProvider,
    );
    final ReportStoreReviewViewModel viewmodel = ref.read(
      reportStoreReviewViewModelProvider.notifier,
    );

    final StoreDetailReviewModel review = storeDetailState
        .storeDetail!
        .storeReviews!
        .firstWhere(
          (StoreDetailReviewModel e) => e.reviewUuid == widget.reviewUuid,
        );

    ref.listen(
      reportStoreReviewViewModelProvider.select(
        (ReportStoreReviewState state) => state.reportStoreReviewStatus,
      ),
      (Status? prev, Status next) {
        if (next.isSuccess) {
          context.pushReplacementNamed(
            AppRoutes.successReportStoreReview.name,
            pathParameters: <String, String>{'id': widget.storeUuid},
          );
        } else if (next.isFailure) {
          _showFailureMessage();
        }
      },
    );

    return CustomLoadingOverlay(
      isLoading: state.reportStoreReviewStatus.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(
          title: '신고',
          actions: <Widget>[],
          primary: false,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                // TODO: 성별에 따라 위젯을 달리 적용해야함
                                CustomProfilePhotoSize.boy(
                                  imageUrl: review.profileImage,
                                  size: CustomProfilePhotoSizeEnum.s,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    review.nickname,
                                    style: textTheme.labelLarge?.copyWith(
                                      color: ScaleColorConfig.neutral10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              review.content,
                              style: textTheme.bodySmall?.copyWith(
                                color: ScaleColorConfig.neutral30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: colorScheme.outlineVariant,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
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
                            ...ReportCategory.values.map((ReportCategory e) {
                              // 기타 사유에 해당하는 경우
                              // 기타 사유 전용 위젯 반환
                              if (e == ReportCategory.etc) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: CustomReportedOptionItem.otherReason(
                                    label: e.text,
                                    onTap: () {
                                      viewmodel.updateReportCategoryId(
                                        reportCategoryId: e.id,
                                      );
                                    },
                                    onTextChanged: (String val) {
                                      viewmodel.updateReportComment(
                                        reportComment: val,
                                      );
                                    },
                                    selected: state.reportCategoryId == e.id,
                                  ),
                                );
                              }

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: CustomReportedOptionItem.basic(
                                  label: e.text,
                                  onTap: () {
                                    viewmodel.updateReportCategoryId(
                                      reportCategoryId: e.id,
                                    );
                                  },
                                  selected: state.reportCategoryId == e.id,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
                child: CustomFillButton.large(
                  label: '제춣하기',
                  onPressed: () {
                    final UserState userState = ref.read(userViewModelProvider);
                    viewmodel.reportStoreReview(
                      storeUuid: widget.storeUuid,
                      reviewUuid: widget.reviewUuid,
                      userUuid: userState.data.userUuid,
                    );
                  },
                  disabled: !state.summitButtonEnabled,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFailureMessage() {
    final ToastManager toastManager = ref.read(toastManagerProvider);
    toastManager.show(
      context: context,
      aboveBottomNavigation: true,
      toastWidget: CustomSnackBar(
        description: '신고 처리 중 문제가 발생했습니다',
        actionButton: SnackBarActionButton(
          onTap: () {
            toastManager.remove();
          },
          label: '확인',
        ),
      ),
    );
  }
}
