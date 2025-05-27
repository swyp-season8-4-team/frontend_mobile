import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/bottom_sheet/bottom_sheet.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/hexagon_grid/hexagon_grid.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:frontend_mobile/domain/model/store/store_operating_hour_model.dart';
import 'package:frontend_mobile/domain/model/store/store_summary_model.dart';
import 'package:frontend_mobile/domain/model/store/store_top_preference_model.dart';

/// 가게 간략 정보 바텀 시트
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000687-196006&m=dev
class CustomStoreInfoBottomSheetContent extends StatelessWidget {
  const CustomStoreInfoBottomSheetContent({
    required this.isLoading,
    required this.isFailure,
    required this.onRefreshTap,
    required this.onViewDetailTap,
    this.storeSummary,
    super.key,
  });
  final StoreSummaryModel? storeSummary;

  // 다시 시도 버튼 클릭 이벤트 콜백
  final VoidCallback onRefreshTap;

  // 상세 보기 버튼 클릭 이벤트 콜백
  final VoidCallback onViewDetailTap;

  final bool isLoading;
  final bool isFailure;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final DayOfWeek today = DayOfWeek.values[DateTime.now().weekday - 1];

    return CustomBottomSheetContent(
      padding: const EdgeInsets.all(10),
      child:
          isLoading
              ? const SizedBox(
                height: 134,
                child: Center(child: CircularProgressIndicator()),
              )
              : isFailure
              ? SizedBox(
                height: 114,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 2.57),
                      Assets.icon.system.warningFill.svg(
                        width: 30.9,
                        height: 30.9,
                        colorFilter: const ColorFilter.mode(
                          ScaleColorConfig.primary80,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 6.57),
                      Text(
                        '일시적인 오류로 정보를 불러올 수 없어요',
                        style: textTheme.titleSmall?.copyWith(
                          color: ScaleColorConfig.primary20,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomOutlineButton.xSmall(
                        label: '다시 시도',
                        onPressed: onRefreshTap,
                      ),
                    ],
                  ),
                ),
              )
              : Builder(
                builder: (BuildContext context) {
                  // 오늘 가게 영업 여부
                  final StoreOperatingHourModel todayOperatingInfo =
                      storeSummary!.operatingHours.firstWhere(
                        (StoreOperatingHourModel e) => e.dayOfWeek == today,
                      );

                  final DayOfWeek nextDay =
                      DayOfWeek.values[(today.index + 1) %
                          DayOfWeek.values.length];

                  final StoreOperatingHourModel? nextDayOperatingInfo =
                      storeSummary!.operatingHours.firstWhereOrNull(
                        (StoreOperatingHourModel e) => e.dayOfWeek == nextDay,
                      );
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              storeSummary!.name,
                              style: textTheme.titleMedium?.copyWith(
                                color: ScaleColorConfig.primary20,
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: onViewDetailTap,
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                border: Border.all(color: colorScheme.outline),
                              ),
                              child: Text(
                                '상세보기',
                                style: textTheme.labelLarge?.copyWith(
                                  color: ScaleColorConfig.neutral20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 164,
                            child: CustomHexagonGrid(
                              hexagons: <CustomHexagon>[
                                ..._normalizeToLength3<StoreTopPreferenceModel>(
                                  storeSummary!.topPreferences,
                                ).map(
                                  (StoreTopPreferenceModel? e) =>
                                      CustomHexagon(text: e?.name ?? ''),
                                ),
                                ..._normalizeToLength3<String>(
                                  storeSummary!.storeImages
                                      ?.map(
                                        (StoreDetailImageModel e) =>
                                            e.url ?? '',
                                      )
                                      .toList(),
                                ).map((String? e) {
                                  if (e != null) {
                                    return CustomHexagon(imageUrl: e);
                                  }

                                  return const CustomHexagon(text: '');
                                }),
                              ],
                            ),
                          ),
                          const Expanded(flex: 10, child: SizedBox(width: 10)),
                          Expanded(
                            flex: 154,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  storeSummary!.tags.join(' | '),
                                  style: textTheme.labelSmall?.copyWith(
                                    color: ScaleColorConfig.neutral30,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Assets.icon.map.a14x14AddressLine.svg(),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        storeSummary!.address,
                                        style: textTheme.labelSmall?.copyWith(
                                          color: ScaleColorConfig.neutral40,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: <Widget>[
                                    Assets.icon.system.timeLine.svg(
                                      width: 14,
                                      height: 14,
                                      colorFilter: const ColorFilter.mode(
                                        ScaleColorConfig.neutral50,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      !todayOperatingInfo.isClosed
                                          ? '영업중'
                                          : '영업 종료',
                                      style: textTheme.labelSmall?.copyWith(
                                        color: ScaleColorConfig.neutral30,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      todayOperatingInfo.isClosed
                                          ? '${todayOperatingInfo.closingTime} 영업 종료'
                                          : '${nextDayOperatingInfo?.openingTime} 영업 시작',
                                      style: textTheme.labelSmall?.copyWith(
                                        color: ScaleColorConfig.neutral40,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: <Widget>[
                                    Assets.icon.contact.phone1Line.svg(
                                      width: 14,
                                      height: 14,
                                      colorFilter: const ColorFilter.mode(
                                        ScaleColorConfig.neutral50,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        storeSummary!.phone,
                                        style: textTheme.labelSmall?.copyWith(
                                          color: ScaleColorConfig.neutral40,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: <Widget>[
                                    if (storeSummary!.parkingYn == true)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: _CircleImg(
                                          svg: Assets.icon.etc.a20CarFilled,
                                        ),
                                      ),
                                    if (storeSummary!.tumblerYn == true)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: _CircleImg(
                                          svg: Assets.icon.etc.a20TumblrFilled,
                                        ),
                                      ),
                                    if (storeSummary!.animalYn == true)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: _CircleImg(
                                          svg: Assets.icon.etc.a20PetFilled,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 70,
                        child:
                            storeSummary!.storeImages != null
                                ? Row(
                                  children: List<Widget>.generate(3, (
                                    int index,
                                  ) {
                                    final int imageCount =
                                        storeSummary!.storeImages!.length;

                                    // 이미지가 없는 경우 빈 공간 유지
                                    if (index >= imageCount) {
                                      return const Expanded(child: SizedBox());
                                    }

                                    final String imageUrl =
                                        storeSummary!.storeImages![index].url ??
                                        '';

                                    // 마지막 이미지에 남은 수가 있으면 표시
                                    final int? numberOfImages =
                                        (index == 2 && imageCount > 3)
                                            ? imageCount - 3
                                            : null;

                                    return Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: index < 2 ? 6 : 0,
                                        ),
                                        child: _StoreImage(
                                          imageUrl: imageUrl,
                                          numberOfImages: numberOfImages,
                                        ),
                                      ),
                                    );
                                  }),
                                )
                                : const SizedBox.shrink(),
                      ),
                    ],
                  );
                },
              ),
    );
  }

  List<T?> _normalizeToLength3<T>(List<T>? input) {
    if (input == null || input.isEmpty) {
      return List<T?>.filled(3, null);
    } else if (input.length == 1) {
      return <T?>[input[0], input[0], input[0]];
    } else if (input.length == 2) {
      return <T?>[input[0], input[1], input[0]];
    } else {
      return input.sublist(0, 3);
    }
  }
}

class _CircleImg extends StatelessWidget {
  const _CircleImg({required this.svg});
  final SvgGenImage svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFE8E8E8),
      ),
      alignment: Alignment.center,
      child: svg.svg(),
    );
  }
}

class _StoreImage extends StatelessWidget {
  const _StoreImage({required this.imageUrl, this.numberOfImages});
  final String imageUrl;
  final int? numberOfImages;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          height: 70,
          width: size.width,
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
        if (numberOfImages != null)
          Positioned.fill(
            child: Container(
              color: ScaleColorConfig.neutral0.withAlpha(100),
              child: Center(
                child: Text(
                  '+$numberOfImages!',
                  style: textTheme.labelMedium?.copyWith(
                    color: ScaleColorConfig.primary100,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
