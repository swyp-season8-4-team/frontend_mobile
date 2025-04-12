part of '../map_view.dart';

// ignore: library_private_types_in_public_api
extension MapViewWidgetExt on _MapViewState {
  // 상단 필터
  Widget _buildFilterList() {
    final MapState state = ref.watch(mapViewModelProvider);
    final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);
    return SizedBox(
      height: 28,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              CustomFloatingChip(
                label: '내 취향',
                selected: state.myPreferenceFilterSelected,
                onPressed: () async {
                  final ({double lat, double lng, double radius}) queryOption =
                      await _getQueryOption();

                  viewmodel.updateMyPreferenceFilter(
                    lat: queryOption.lat,
                    lng: queryOption.lng,
                    radius: queryOption.radius,
                  );
                },
              ),
              ...state.preferences.mapIndexed(
                (int index, PreferenceModel e) => Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: CustomFloatingChip(
                    label: e.preferenceName,
                    selected: state.preferenceTagIds.contains(e.id),
                    onPressed: () async {
                      final ({double lat, double lng, double radius})
                      queryOption = await _getQueryOption();
                      viewmodel.updatePreferenceFilter(
                        lat: queryOption.lat,
                        lng: queryOption.lng,
                        radius: queryOption.radius,
                        preference: e,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 우측 버튼
  Widget _buildControlButtons() {
    final MapState state = ref.watch(mapViewModelProvider);
    final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (!state.myPreferenceFilterSelected &&
            state.preferenceTagIds.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomMapIconButton.filterReset(
              onPressed: () async {
                final ({double lat, double lng, double radius}) queryOption =
                    await _getQueryOption();
                viewmodel.clearAllFilter(
                  lng: queryOption.lng,
                  lat: queryOption.lat,
                  radius: queryOption.lng,
                );
              },
            ),
          ),
        CustomMapIconButton.saveStore(isSelected: true, onPressed: () {}),
        const SizedBox(height: 10),
        CustomMapIconButton.myLocation(
          isSelected: false,
          onPressed: () {
            _goToCurrentLocation();
          },
        ),
      ],
    );
  }

  // 하단 중앙 새로고침 버튼
  Widget _buildRefreshButton() {
    final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () async {
          final ({double lat, double lng, double radius}) queryOption =
              await _getQueryOption();
          viewmodel.getStoresByCameraPosition(
            lat: queryOption.lat,
            lng: queryOption.lng,
            radius: queryOption.radius,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.outline),
            boxShadow: ShadowConfig().level1,
            borderRadius: BorderRadius.circular(99),
            color: ScaleColorConfig.primary100,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Assets.icon.system.refresh1Line.svg(
                width: 18,
                height: 18,
                colorFilter: const ColorFilter.mode(
                  ScaleColorConfig.success50,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '현 위치에서 새로고침',
                style: textTheme.labelLarge?.copyWith(
                  color: ScaleColorConfig.success50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 가게 간략 정보를 표시하기 위한 바텀시트 표출
  Future<void> _showStoreSummary() async {
    CustomBottomSheet.middle(
      context: context,
      barrierColor: Colors.transparent,
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final MapState state = ref.watch(mapViewModelProvider);
          final TextTheme textTheme = Theme.of(context).textTheme;
          final ColorScheme colorScheme = Theme.of(context).colorScheme;
          final DayOfWeek today = DayOfWeek.values[DateTime.now().weekday - 1];

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            child:
                state.getStoreSummaryStatus.isLoading ||
                        state.getStoreSummaryStatus.isInitial
                    ? const SizedBox(
                      height: 298 - 32,
                      child: Center(child: CircularProgressIndicator()),
                    )
                    : Builder(
                      builder: (BuildContext context) {
                        final StoreSummaryModel storeSummary =
                            state.storeSummary!;

                        // 오늘 가게 영업 여부
                        final StoreOperatingHourModel todayOperatingInfo =
                            storeSummary.operatingHours.firstWhere(
                              (StoreOperatingHourModel e) =>
                                  e.dayOfWeek == today,
                            );

                        final DayOfWeek nextDay =
                            DayOfWeek.values[(today.index + 1) %
                                DayOfWeek.values.length];

                        final StoreOperatingHourModel? nextDayOperatingInfo =
                            storeSummary.operatingHours.firstWhereOrNull(
                              (StoreOperatingHourModel e) =>
                                  e.dayOfWeek == nextDay,
                            );
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  storeSummary.name,
                                  style: textTheme.titleMedium?.copyWith(
                                    color: ScaleColorConfig.primary20,
                                  ),
                                ),

                                // TODO: Outline Button(xsmall)를 이용하여 구현 예정
                                GestureDetector(
                                  onTap: () {},
                                  behavior: HitTestBehavior.translucent,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(99),
                                      border: Border.all(
                                        color: colorScheme.outline,
                                      ),
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
                                // TODO: Hexagon Grid를 이용한 가게 이미지 표시 예정
                                Container(
                                  width: 164,
                                  height: 150,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      storeSummary.tags.join(' | '),
                                      style: textTheme.labelSmall?.copyWith(
                                        color: ScaleColorConfig.neutral30,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          storeSummary.address,
                                          style: textTheme.labelSmall?.copyWith(
                                            color: ScaleColorConfig.neutral40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: <Widget>[
                                        Text(
                                          todayOperatingInfo.isClosed
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: <Widget>[
                                        Text(
                                          storeSummary.phone,
                                          style: textTheme.labelSmall?.copyWith(
                                            color: ScaleColorConfig.neutral40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: <Widget>[
                                        if (storeSummary.parkingYn == true)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 10,
                                            ),
                                            child: _CircleImg(
                                              svg: Assets.icon.etc.a20CarFilled,
                                            ),
                                          ),
                                        if (storeSummary.tumblerYn == true)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 10,
                                            ),
                                            child: _CircleImg(
                                              svg:
                                                  Assets
                                                      .icon
                                                      .etc
                                                      .a20TumblrFilled,
                                            ),
                                          ),
                                        if (storeSummary.animalYn == true)
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
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 70,
                              child:
                                  storeSummary.storeImages != null
                                      ? Row(
                                        children: List<Widget>.generate(3, (
                                          int index,
                                        ) {
                                          final int imageCount =
                                              storeSummary.storeImages!.length;

                                          // 이미지가 없는 경우 빈 공간 유지
                                          if (index >= imageCount) {
                                            return const Expanded(
                                              child: SizedBox(),
                                            );
                                          }

                                          final String imageUrl =
                                              storeSummary.storeImages![index];

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
        },
      ),
    );
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
