import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:intl/intl.dart';

// 가게 상세 페이지 > 한줄 리뷰 목록 아이템 UI
class StoreReviewCard extends StatelessWidget {
  const StoreReviewCard({
    required this.storeReview,
    required this.onReportTap,
    required this.onBlockTap,
    required this.isOptionMenuVisible,
    required this.onMenuTap,
    super.key,
  });
  final StoreDetailReviewModel storeReview;
  final VoidCallback onReportTap;
  final VoidCallback onBlockTap;
  final VoidCallback onMenuTap;
  final bool isOptionMenuVisible;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            if (storeReview.gender == ReviewerGender.male)
              CustomProfilePhotoSize.boy(
                imageUrl: storeReview.profileImage,
                size: CustomProfilePhotoSizeEnum.m,
              )
            else
              CustomProfilePhotoSize.girl(
                imageUrl: storeReview.profileImage,
                size: CustomProfilePhotoSizeEnum.m,
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                storeReview.nickname,
                style: textTheme.titleSmall?.copyWith(
                  color: ScaleColorConfig.neutral20,
                ),
              ),
            ),
            const SizedBox(width: 10),
            PortalTarget(
              portalFollower: Container(
                margin: const EdgeInsets.only(top: 8),
                child: CustomOptionMenuDropdown(
                  optionMenus: <CustomOptionMenu>[
                    CustomOptionMenu(text: '신고하기', onTap: onReportTap),
                    CustomOptionMenu(text: '차단하기', onTap: onBlockTap),
                  ],
                ),
              ),
              anchor: const Aligned(
                follower: Alignment.topRight,
                target: Alignment.bottomRight,
              ),
              visible: isOptionMenuVisible,
              child: GestureDetector(
                onTap: onMenuTap,
                child: Assets.icon.menu.more2Fill.svg(
                  colorFilter: const ColorFilter.mode(
                    ScaleColorConfig.neutral40,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
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
