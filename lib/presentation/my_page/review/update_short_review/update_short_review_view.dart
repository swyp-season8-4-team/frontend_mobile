import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/photo/photo_card.dart';
import 'package:frontend_mobile/common/design_system/component/photo/photo_uploader.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/image_util.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/user/user_review_model.dart';
import 'package:frontend_mobile/presentation/global/user_review/user_review_view_model.dart';
import 'package:frontend_mobile/presentation/my_page/review/update_short_review/update_short_review_view_model.dart';
import 'package:frontend_mobile/presentation/widget/review_note.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class UpdateShortReviewView extends ConsumerStatefulWidget {
  const UpdateShortReviewView({
    required this.reviewUuid,
    required this.storeUuid,
    super.key,
  });
  final String reviewUuid;
  final String storeUuid;

  @override
  ConsumerState<UpdateShortReviewView> createState() =>
      _UpdateShortReviewViewState();
}

class _UpdateShortReviewViewState extends ConsumerState<UpdateShortReviewView> {
  final int _contentMaxLength = 50;
  final TopBarIcon _icon = TopBarIcon();

  final TextEditingController _contentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 한줄 리뷰 수정에 필요한 상태값 초기화

      final UserReviewState userReviewState = ref.read(
        userReviewViewModelProvider,
      );

      final UserReviewDetailModel shortReview = userReviewState
          .shortReview
          .reviews
          .firstWhere(
            (UserReviewDetailModel e) => e.reviewUuid == widget.reviewUuid,
          );

      final UpdateShortReviewViewModel viewmodel = ref.read(
        updateShortReviewViewModelProvider.notifier,
      );

      viewmodel.updateContent(content: shortReview.content);
      _contentTextController.text = shortReview.content;

      viewmodel.updateRating(rating: shortReview.rating.round());

      viewmodel.updateImage(
        image:
            shortReview.reviewImage != null
                ? await ImageUtil.downloadImageUrlToFile(
                  shortReview.reviewImage!,
                )
                : null,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final UpdateShortReviewState state = ref.watch(
      updateShortReviewViewModelProvider,
    );

    final UserReviewState userReviewState = ref.watch(
      userReviewViewModelProvider,
    );
    final UpdateShortReviewViewModel viewmodel = ref.read(
      updateShortReviewViewModelProvider.notifier,
    );

    final UserReviewDetailModel shortReview = userReviewState
        .shortReview
        .reviews
        .firstWhere(
          (UserReviewDetailModel e) => e.reviewUuid == widget.reviewUuid,
        );

    final UserReviewStoreModel storeInfo = shortReview.store;

    ref.listen(
      updateShortReviewViewModelProvider.select(
        (UpdateShortReviewState state) => state.updateShortReviewStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          ref.read(userReviewViewModelProvider.notifier).getMyShortReviews();
          context.pop(true);
        }
      },
    );

    return CustomLoadingOverlay(
      isLoading: state.updateShortReviewStatus.isLoading,
      child: Scaffold(
        appBar: CustomSubTopBar(
          title: '리뷰 수정',
          actions: const <Widget>[],
          primary: false,
          leading: _icon.leftLine(
            onTap: () async {
              if (state.content.isNotEmpty) {
                final dynamic result = await showDialog(
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
                          context.pop(true);
                        },
                      ),
                    );
                  },
                );

                if (result == true && context.mounted) {
                  context.pop();
                }
              } else {
                context.pop();
              }
            },
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: CustomFillButton.medium(
              label: '저장',
              disabled: !state.updateButtonEnabled,
              onPressed: () {
                viewmodel.updateShortReview(
                  reviewUuid: widget.reviewUuid,
                  storeUuid: widget.storeUuid,
                );
              },
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: colorScheme.outlineVariant),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black.withAlpha(20)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: storeInfo.thumbnail ?? '',
                          errorWidget: (_, __, ___) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              storeInfo.name,
                              style: textTheme.titleSmall?.copyWith(
                                color: const Color(0xFF393939),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Assets.icon.map.a14x14AddressLine.svg(
                                  colorFilter: const ColorFilter.mode(
                                    ScaleColorConfig.neutral50,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    storeInfo.address,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.labelSmall?.copyWith(
                                      color: ScaleColorConfig.neutral40,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '평점',
                        style: textTheme.titleSmall?.copyWith(
                          color: ScaleColorConfig.neutral30,
                        ),
                      ),
                      const SizedBox(height: 7),
                      RatingBar.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Assets.icon.etc.a16StarFilled.svg();
                        },
                        itemSize: 24,
                        minRating: 1,
                        maxRating: 5,
                        itemPadding: const EdgeInsets.only(right: 4.5),
                        unratedColor: ScaleColorConfig.neutral60,
                        initialRating: state.rating.roundToDouble(),
                        glow: false,
                        tapOnlyMode: true,
                        onRatingUpdate: (double rating) {
                          viewmodel.updateRating(rating: rating.round());
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '한 줄 리뷰',
                              style: textTheme.titleSmall?.copyWith(
                                color: ScaleColorConfig.neutral30,
                              ),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '${state.content.length}',
                                  style: textTheme.labelLarge?.copyWith(
                                    color: ScaleColorConfig.neutral30,
                                  ),
                                ),
                                TextSpan(
                                  text: '/$_contentMaxLength',
                                  style: textTheme.labelLarge?.copyWith(
                                    color: ScaleColorConfig.neutral50,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      CustomInputBox(
                        maxLength: 50,
                        onChanged: (String val) {
                          viewmodel.updateContent(content: val);
                        },
                        hintText: '리뷰를 작성해주세요',
                        closeControll: true,
                        onCloseButtonTap: () {
                          viewmodel.updateContent(content: '');
                        },
                        controller: _contentTextController,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '(선택) 리뷰를 꾸며줄 사진 1장 추가해보세요',
                        style: textTheme.labelMedium?.copyWith(
                          color: ScaleColorConfig.neutral40,
                        ),
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        height: 68,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomPhotoUploader(
                              onImageInsert: (List<XFile> xFile) {
                                if (xFile.isEmpty) {
                                  return;
                                }

                                viewmodel.updateImage(
                                  image: File(xFile.first.path),
                                );
                              },
                            ),
                            const SizedBox(width: 6),
                            if (state.image != null)
                              CustomPhotoCard.file(
                                file: state.image,
                                onRemove: () {
                                  viewmodel.updateImage();
                                },
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorScheme.outlineVariant,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '리뷰 유의사항',
                              style: textTheme.labelMedium?.copyWith(
                                color: ScaleColorConfig.neutral30,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const ReviewNote(
                              note:
                                  '한 줄 리뷰는 장소 방문 경험을 기록하고, 도움이 될만한 정보를 공유하기 위해 메이트들과 가게 사장님들이 함께 소통하는 공간입니다.',
                            ),
                            const ReviewNote(
                              note: '욕설, 성희롱, 명예훼손성 표현은 가게 사장님들께 큰 상처가 됩니다.',
                            ),
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
      ),
    );
  }

  @override
  void dispose() {
    _contentTextController.dispose();
    super.dispose();
  }
}
