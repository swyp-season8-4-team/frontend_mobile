import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:intl/intl.dart';

// 가게 상세 페이지 > 한줄 리뷰 목록 아이템 UI
class StoreReviewCard extends StatelessWidget {
  const StoreReviewCard({required this.storeReview, super.key});
  final StoreDetailReviewModel storeReview;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            // TODO: 성별에 따라 위젯을 달리 적용해야함
            CustomProfilePhotoSize.boy(
              imageUrl: storeReview.profileImage,
              size: CustomProfilePhotoSizeEnum.m,
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(storeReview.nickname)),
          ],
        ),
        if (storeReview.images != null && storeReview.images!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CachedNetworkImage(
              imageUrl: storeReview.images!.first,
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
              initialRating: storeReview.rating.roundToDouble(),
              allowHalfRating: true,
              itemCount: storeReview.rating.round(),
              itemPadding: const EdgeInsets.only(right: 2),
              itemSize: 12,
              itemBuilder:
                  (BuildContext context, _) =>
                      Assets.icon.etc.a16StarFilled.svg(),
              onRatingUpdate: (_) {},
              ignoreGestures: true,
            ),
            Text(
              '${storeReview.rating.round()}',
              style: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.neutral20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          storeReview.content,
          style: textTheme.bodySmall?.copyWith(
            color: ScaleColorConfig.neutral20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          DateFormat('yyyy.MM.dd').format(storeReview.createdAt),
          style: textTheme.labelSmall?.copyWith(
            color: ScaleColorConfig.neutral40,
          ),
        ),
      ],
    );
  }
}
