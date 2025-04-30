import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar_right_item.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/user/user_review_model.dart';
import 'package:frontend_mobile/presentation/global/user_review/user_review_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/widget/my_short_review_card.dart';
import 'package:go_router/go_router.dart';

class MyReviewView extends ConsumerWidget {
  const MyReviewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final UserReviewState userReviewState = ref.watch(
      userReviewViewModelProvider,
    );
    final UserReviewModel review = userReviewState.shortReview;

    ref.listen(
      userReviewViewModelProvider.select(
        (UserReviewState state) => state.deleteMyShortReviewStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          ref.read(userReviewViewModelProvider.notifier).getMyShortReviews();
          _showSuccessDeleteShortReview(context, ref);
        }
      },
    );

    return CustomLoadingOverlay(
      isLoading:
          userReviewState.getMyShortReviewsStatus.isLoading ||
          userReviewState.deleteMyShortReviewStatus.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(
          title: '리뷰',
          actions: <Widget>[],
          primary: false,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      '작성한 리뷰',
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.neutral20,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${review.reviewCount}',
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.success50,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: colorScheme.outlineVariant),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    final UserReviewDetailModel reviewItem =
                        review.reviews[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: MyShortReviewCard(
                        review: reviewItem,
                        onUpdateTap: () async {
                          final Object? result = await context.pushNamed(
                            AppRoutes.updateShortReview.name,
                            queryParameters: <String, String>{
                              'reviewUuid': reviewItem.reviewUuid,
                              'storeUuid': reviewItem.store.storeUuid,
                            },
                          );

                          if (result == true && context.mounted) {
                            _showSuccessUpdateShortReview(context, ref);
                          }
                        },
                        onDeleteTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialog.basic(
                                title: '작성한 리뷰를 삭제하시겠어요?',
                                description: '삭제된 리뷰는 복구 및 재작성이\n불가능합니다.',
                                primaryButton: CustomDialogButton(
                                  text: '확인',
                                  onTap: () {
                                    ref
                                        .read(
                                          userReviewViewModelProvider.notifier,
                                        )
                                        .deleteMyShortReview(
                                          storeUuid: reviewItem.store.storeUuid,
                                          reviewUuid: reviewItem.reviewUuid,
                                        );
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
                        onStoreInfoTap: () {
                          context.pushNamed(
                            AppRoutes.storeDetail.name,
                            pathParameters: <String, String>{
                              'id': reviewItem.store.storeUuid,
                            },
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                      color: colorScheme.outlineVariant,
                    );
                  },
                  itemCount: review.reviews.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessUpdateShortReview(BuildContext context, WidgetRef ref) {
    final ToastManager toastManager = ref.read(toastManagerProvider);
    toastManager.show(
      context: context,
      toastWidget: CustomSnackBar(
        description: '해당 리뷰가 수정되었습니다',
        actionButton: SnackBarActionButton(
          onTap: () {
            toastManager.remove();
          },
          label: '확인',
        ),
      ),
    );
  }

  void _showSuccessDeleteShortReview(BuildContext context, WidgetRef ref) {
    final ToastManager toastManager = ref.read(toastManagerProvider);
    toastManager.show(
      context: context,
      toastWidget: CustomSnackBar(
        description: '해당 리뷰가 삭제되었습니다',
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
