import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
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
    return Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
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
                      onUpdateTap: () {
                        // TODO: 수정
                      },
                      onDeleteTap: () {
                        // TODO: 삭제
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
                  return Divider(height: 1, color: colorScheme.outlineVariant);
                },
                itemCount: review.reviews.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
