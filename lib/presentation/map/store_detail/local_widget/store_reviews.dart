part of '../store_detail_view.dart';

class _StoreReviews extends ConsumerWidget {
  const _StoreReviews();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);
    final StoreDetailViewModel viewmodel = ref.read(
      storeDetailViewModelProvider.notifier,
    );

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: _StoreReviewHeader(
            widget: Container(
              color: ScaleColorConfig.neutral100,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                '한 줄 리뷰',
                                style: textTheme.titleSmall?.copyWith(
                                  color: ScaleColorConfig.neutral20,
                                ),
                              ),
                            ),
                            CustomOutlineButton.xSmall(
                              width: 91,
                              label: '리뷰쓰기',
                              svg: Assets.icon.editor.pencil2Line,
                              onPressed: () async {
                                if (state.todayReviewExist) {
                                  await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomDialog.basic(
                                        description: '오늘은 이미 리뷰를 작성하셨어요',
                                        primaryButton: CustomDialogButton(
                                          text: '확인',
                                          onTap: () {
                                            context.pop();
                                          },
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  final Object? result = await context
                                      .pushNamed(
                                        AppRoutes.addStoreReview.name,
                                        pathParameters: <String, String>{
                                          'id': state.storeDetail!.storeUuid,
                                        },
                                      );

                                  if (result == true && context.mounted) {
                                    _showSuccessAddStoreReview(context, ref);
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 9),
                        Row(
                          children: <Widget>[
                            Text(
                              '· 최신순',
                              style: textTheme.bodySmall?.copyWith(
                                color: ScaleColorConfig.neutral20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Assets.icon.system.chart1Filled.svg(
                              width: 16,
                              height: 16,
                              colorFilter: const ColorFilter.mode(
                                ScaleColorConfig.neutral40,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '업데이트 주기: 하루 단위',
                              style: textTheme.bodySmall?.copyWith(
                                color: ScaleColorConfig.neutral40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: colorScheme.outlineVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (state.storeDetail!.storeReviews != null)
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final StoreDetailReviewModel storeReview =
                  state.storeDetail!.storeReviews![index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 13, 16, 11),
                child: StoreReviewCard(
                  storeReview: storeReview,
                  onMenuTap: () {
                    viewmodel.updateReviewOptionMenuVisible(
                      reviewUuid: storeReview.reviewUuid,
                      isVisible: true,
                    );
                  },
                  onBlockTap: () {
                    viewmodel.invisibleAllReviewOptionMenu();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog.basic(
                          title: '${storeReview.nickname}님을 차단하시겠어요?',
                          description:
                              '차단하면 상대방이 진행하는 디저비 활동 정보를 모두 볼 수 없어요.\n추후 [My > 설정 > 차단 멤버 관리하기]에서 언제든지 해제할 수 있어요',
                          secondaryButton: CustomDialogButton(
                            text: '아니오',
                            onTap: () => context.pop(),
                          ),
                          primaryButton: CustomDialogButton(
                            warning: true,
                            text: '네, 차단할래요',
                            onTap: () {
                              viewmodel.blockUser(
                                blockedUserUuid: storeReview.userUuid,
                                blockedNickname: storeReview.nickname,
                              );
                              context.pop();
                            },
                          ),
                        );
                      },
                    );
                  },
                  onReportTap: () {
                    viewmodel.invisibleAllReviewOptionMenu();

                    context.pushNamed(
                      AppRoutes.reportStoreReview.name,
                      pathParameters: <String, String>{
                        'id': state.storeDetail!.storeUuid,
                        'reviewUuid': storeReview.reviewUuid,
                      },
                    );
                  },
                  isOptionMenuVisible:
                      state.reviewMenuOptionsVisible
                          .firstWhereOrNull(
                            (
                              ({bool isOptionMenuVisible, String reviewUuid}) e,
                            ) => e.reviewUuid == storeReview.reviewUuid,
                          )
                          ?.isOptionMenuVisible ??
                      false,
                ),
              );
            }, childCount: state.storeDetail!.storeReviews!.length),
          ),
      ],
    );
  }

  void _showSuccessAddStoreReview(BuildContext context, WidgetRef ref) {
    final ToastManager toastManager = ref.read(toastManagerProvider);
    toastManager.show(
      context: context,
      toastWidget: CustomSnackBar(
        description: '한 줄 리뷰가 추가되었습니다',
        actionButton: SnackBarActionButton(
          onTap: () {
            toastManager.remove();
          },
          label: '닫기',
        ),
      ),
    );
  }
}

class _StoreReviewHeader extends SliverPersistentHeaderDelegate {
  _StoreReviewHeader({required this.widget});

  Widget widget;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return widget;
  }

  @override
  double get maxExtent => 124.1;

  @override
  double get minExtent => 124.1;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
