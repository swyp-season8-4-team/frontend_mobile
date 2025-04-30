import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/model/user/user_review_model.dart';
import 'package:intl/intl.dart';

/// 내가 작성한 한줄리뷰 목록 아이템 UI
class MyShortReviewCard extends StatelessWidget {
  const MyShortReviewCard({
    required this.review,
    required this.onUpdateTap,
    required this.onDeleteTap,
    required this.onStoreInfoTap,
    super.key,
  });
  final UserReviewDetailModel review;
  final VoidCallback onUpdateTap;
  final VoidCallback onDeleteTap;
  final VoidCallback onStoreInfoTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: onStoreInfoTap,
          behavior: HitTestBehavior.translucent,
          child: _ReviewStore(store: review.store),
        ),
        if (review.reviewImage != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CachedNetworkImage(
              imageUrl: review.reviewImage!,
              width: size.width,
              height: size.width,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) {
                // TODO: 에러 UI 필요
                return const Icon(Icons.error);
              },
            ),
          ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            RatingBar.builder(
              initialRating: review.rating.roundToDouble(),
              allowHalfRating: true,
              itemCount: review.rating.round(),
              itemPadding: const EdgeInsets.only(right: 2),
              itemSize: 12,
              itemBuilder:
                  (BuildContext context, _) =>
                      Assets.icon.etc.a16StarFilled.svg(),
              onRatingUpdate: (_) {},
              ignoreGestures: true,
            ),
            Text(
              '${review.rating.round()}',
              style: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.neutral20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          review.content,
          style: textTheme.bodySmall?.copyWith(
            color: ScaleColorConfig.neutral20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          DateFormat('yyyy.MM.dd').format(review.createdAt),
          style: textTheme.labelSmall?.copyWith(
            color: ScaleColorConfig.neutral40,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // TODO: CustomFillButton을 수정하여 적용할 필요가 있어보임
            _ActionButton(label: '수정', onTap: onUpdateTap),
            const SizedBox(width: 6),
            CustomOutlineButton.xSmall(
              label: '삭제',
              onPressed: onDeleteTap,
              width: 47,
            ),
          ],
        ),
      ],
    );
  }
}

class _ReviewStore extends StatelessWidget {
  const _ReviewStore({required this.store});
  final UserReviewStoreModel store;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            errorWidget:
                (BuildContext context, String url, Object error) =>
                    const Icon(Icons.error),
            fit: BoxFit.cover,
            width: 36,
            height: 36,
            imageUrl: store.thumbnail ?? '',
            imageBuilder: (
              BuildContext context,
              ImageProvider<Object> imageProvider,
            ) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  store.name,
                  style: textTheme.titleSmall?.copyWith(
                    // TODO: 컬러 적용 필요
                    color: const Color(0xFF393939),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: <Widget>[
                    Assets.icon.map.a14x14AddressLine.svg(
                      colorFilter: const ColorFilter.mode(
                        ScaleColorConfig.neutral50,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        store.address,
                        style: textTheme.labelSmall?.copyWith(
                          color: ScaleColorConfig.neutral40,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ScaleColorConfig.primary80,
      ),
      child: SizedBox(
        width: 23,
        child: Center(
          child: Text(
            label,
            style: textTheme.labelLarge?.copyWith(
              color: const Color(0xFF412D00),
            ),
          ),
        ),
      ),
    );
  }
}
