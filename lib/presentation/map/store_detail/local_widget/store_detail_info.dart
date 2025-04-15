part of '../store_detail_view.dart';

class _StoreDetailInfo extends ConsumerWidget {
  const _StoreDetailInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);
    final StoreDetailModel storeDetail = state.storeDetail!;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Assets.icon.map.a14x14AddressLine.svg(),
              const SizedBox(width: 10),
              Container(
                constraints: const BoxConstraints(maxWidth: 210),
                child: Text(
                  storeDetail.address,
                  style: textTheme.labelMedium?.copyWith(
                    color: ScaleColorConfig.neutral30,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '길찾기',
                style: textTheme.labelMedium?.copyWith(
                  color: ScaleColorConfig.secondary60,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _OperatingHours(storeDetail: storeDetail),
        ],
      ),
    );
  }
}

// 영업 시간 정보 위젯
class _OperatingHours extends StatefulWidget {
  const _OperatingHours({required this.storeDetail});
  final StoreDetailModel storeDetail;

  @override
  State<_OperatingHours> createState() => _OperatingHoursState();
}

class _OperatingHoursState extends State<_OperatingHours> {
  bool _isExpanded = false;

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final DayOfWeek today = DayOfWeek.values[DateTime.now().weekday - 1];

    // 오늘 가게 영업 여부
    final StoreOperatingHourModel todayOperatingInfo = widget
        .storeDetail
        .operatingHours
        .firstWhere((StoreOperatingHourModel e) => e.dayOfWeek == today);

    // 다음날 요일
    final DayOfWeek nextDay =
        DayOfWeek.values[(today.index + 1) % DayOfWeek.values.length];

    // 다음날의 영업 정보
    final StoreOperatingHourModel? nextDayOperatingInfo = widget
        .storeDetail
        .operatingHours
        .firstWhereOrNull(
          (StoreOperatingHourModel e) => e.dayOfWeek == nextDay,
        );

    // 매주 쉬는 날
    final List<StoreOperatingHourModel> closureDays =
        widget.storeDetail.operatingHours
            .where(
              (StoreOperatingHourModel e) =>
                  e.regularClosureType == RegularClosureType.weekly,
            )
            .toList();
    return GestureDetector(
      onTap: () {
        _toggle();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Assets.icon.system.timeLine.svg(
                width: 14,
                height: 14,
                colorFilter: const ColorFilter.mode(
                  ScaleColorConfig.neutral30,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                !todayOperatingInfo.isClosed ? '영업중' : '영업 종료',
                style: textTheme.labelMedium?.copyWith(
                  color: ScaleColorConfig.neutral30,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                todayOperatingInfo.isClosed
                    ? '${todayOperatingInfo.closingTime} 영업 종료'
                    : '${nextDayOperatingInfo?.openingTime} 영업 시작',
                style: textTheme.labelMedium?.copyWith(
                  color: ScaleColorConfig.neutral40,
                ),
              ),
              const SizedBox(width: 4),
              _OpenButton(isOpen: _isExpanded),
            ],
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.centerLeft,
            child:
                _isExpanded
                    ? Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (closureDays.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                '매주 ${closureDays.map((StoreOperatingHourModel e) => '${e.dayOfWeek.label}요일').join(',')} 정기휴무',
                                style: textTheme.labelMedium?.copyWith(
                                  color: ScaleColorConfig.neutral30,
                                ),
                              ),
                            ),
                          const SizedBox(height: 4),
                          ...widget.storeDetail.operatingHours.map(
                            (StoreOperatingHourModel e) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  e.dayOfWeek.label,
                                  style: textTheme.labelMedium?.copyWith(
                                    color: ScaleColorConfig.neutral30,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                if (e.regularClosureType ==
                                    RegularClosureType.weekly)
                                  Text(
                                    '매주 휴무',
                                    style: textTheme.labelMedium?.copyWith(
                                      color: ScaleColorConfig.neutral30,
                                    ),
                                  )
                                else
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${e.openingTime} - ${e.closingTime}',
                                        style: textTheme.labelMedium?.copyWith(
                                          color: ScaleColorConfig.neutral30,
                                        ),
                                      ),
                                      if (e.breakTimes != null &&
                                          e.breakTimes!.isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 4,
                                          ),
                                          child: Text(
                                            '${e.breakTimes![0].startTime} - ${e.breakTimes![0].endTime}',
                                            style: textTheme.labelMedium
                                                ?.copyWith(
                                                  color:
                                                      ScaleColorConfig
                                                          .neutral30,
                                                ),
                                          ),
                                        ),
                                      if (e.lastOrderTime != null)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 4,
                                          ),
                                          child: Text(
                                            '라스트 오더 ${e.lastOrderTime}',
                                            style: textTheme.labelMedium
                                                ?.copyWith(
                                                  color:
                                                      ScaleColorConfig
                                                          .neutral30,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _OpenButton extends StatelessWidget {
  const _OpenButton({this.isOpen = false});
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    const ColorFilter svgColorFilter = ColorFilter.mode(
      Color(0xFFA2A2A2),
      BlendMode.srcIn,
    );

    return Container(
      width: 12.8,
      height: 12.8,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFEFEFEF),
      ),
      child:
          isOpen
              ? Assets.icon.arrow.upLine.svg(
                width: 12.8,
                height: 12.8,
                colorFilter: svgColorFilter,
              )
              : Assets.icon.arrow.downLine.svg(
                width: 12.8,
                height: 12.8,
                colorFilter: svgColorFilter,
              ),
    );
  }
}
