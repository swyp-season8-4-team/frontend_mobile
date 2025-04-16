part of '../store_detail_view.dart';

class _StoreDetailInfo extends ConsumerWidget {
  const _StoreDetailInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);
    final StoreDetailModel storeDetail = state.storeDetail!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _Address(storeDetail: storeDetail),
          const SizedBox(height: 8),
          _OperatingHours(storeDetail: storeDetail),
          const SizedBox(height: 8),
          _Phone(storeDetail: storeDetail),
          const SizedBox(height: 8),
          _StoreLinks(storeDetail: storeDetail),
          const SizedBox(height: 12),
          _AttributeTags(storeDetail: storeDetail),
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

// 축소/확장 버튼
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
                width: 8,
                height: 8,
                colorFilter: svgColorFilter,
              )
              : Assets.icon.arrow.downLine.svg(
                width: 8,
                height: 8,
                colorFilter: svgColorFilter,
              ),
    );
  }
}

// 가게 링크 정보 위젯
class _StoreLinks extends StatefulWidget {
  const _StoreLinks({required this.storeDetail});
  final StoreDetailModel storeDetail;

  @override
  State<_StoreLinks> createState() => _StoreLinksState();
}

class _StoreLinksState extends State<_StoreLinks> {
  bool _isExpanded = false;

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Assets.icon.file.link2Line.svg(
              width: 14,
              height: 14,
              colorFilter: const ColorFilter.mode(
                ScaleColorConfig.neutral30,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse(
                    widget.storeDetail.primaryStoreLink ?? '',
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: Text(
                  widget.storeDetail.primaryStoreLink ?? '',
                  maxLines: _isExpanded ? null : 1,
                  style: textTheme.labelMedium?.copyWith(
                    color: ScaleColorConfig.neutral30,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                _toggle();
              },
              child: _OpenButton(isOpen: _isExpanded),
            ),
          ],
        ),
        _isExpanded
            ? Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Wrap(
                children: <Widget>[
                  if (widget.storeDetail.storeLinks?.isNotEmpty == true)
                    ...formattedStoreLink.mapIndexed(
                      (int index, String e) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            final Uri url = Uri.parse(
                              widget.storeDetail.storeLinks![index],
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          },
                          child: Text(
                            e,
                            style: textTheme.labelMedium?.copyWith(
                              color: ScaleColorConfig.neutral30,
                              decoration: TextDecoration.underline,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
            : const SizedBox.shrink(),
      ],
    );
  }

  List<String> get formattedStoreLink {
    final Map<String, List<String>> certainLinks = <String, List<String>>{
      '인스타그램': <String>['https://www.instagram.com/'],
      '블로그': <String>[
        'https://blog.naver.com/',
        'https://section.blog.naver.com/',
      ],
      '카카오채널': <String>['https://pf.kakao.com/'],
      '스마트스토어': <String>[
        'https://shopping.naver.com/',
        'https://brand.naver.com/',
        'https://smartstore.naver.com/',
      ],
      '캐치테이블': <String>['https://app.catchtable.co.kr/'],
    };

    final Set<String> matched = <String>{};

    for (final String link in widget.storeDetail.storeLinks ?? <String>[]) {
      bool isMatched = false;

      for (final MapEntry<String, List<String>> entry in certainLinks.entries) {
        final String serviceName = entry.key;
        final List<String> prefixes = entry.value;

        if (prefixes.any((String prefix) => link.startsWith(prefix))) {
          matched.add(serviceName);
          isMatched = true;
          break;
        }
      }

      if (!isMatched) {
        matched.add('링크');
      }
    }

    return matched.toList();
  }
}

// 주소 정보 UI
class _Address extends StatelessWidget {
  const _Address({required this.storeDetail});
  final StoreDetailModel storeDetail;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: <Widget>[
        Assets.icon.map.a14x14AddressLine.svg(
          width: 14,
          height: 14,
          colorFilter: const ColorFilter.mode(
            ScaleColorConfig.neutral30,
            BlendMode.srcIn,
          ),
        ),
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
        GestureDetector(
          onTap: () {
            context.pushNamed(
              AppRoutes.findPlaceByMap.name,
              pathParameters: <String, String>{'id': storeDetail.storeUuid},
            );
          },
          child: Text(
            '길찾기',
            style: textTheme.labelMedium?.copyWith(
              color: ScaleColorConfig.secondary60,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

// 전화 정보 UI
class _Phone extends StatelessWidget {
  const _Phone({required this.storeDetail});
  final StoreDetailModel storeDetail;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: <Widget>[
        Assets.icon.contact.phone1Line.svg(
          width: 14,
          height: 14,
          colorFilter: const ColorFilter.mode(
            ScaleColorConfig.neutral30,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          storeDetail.phone,
          style: textTheme.labelMedium?.copyWith(
            color: ScaleColorConfig.neutral30,
          ),
        ),
        const SizedBox(width: 6),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            launchUrlString(
              'tel://${storeDetail.phone}',
              mode: LaunchMode.externalApplication,
            );
          },
          child: Text(
            '전화',
            style: textTheme.labelMedium?.copyWith(
              color: ScaleColorConfig.secondary60,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

// 태그 정보 UI
class _AttributeTags extends StatelessWidget {
  const _AttributeTags({required this.storeDetail});
  final StoreDetailModel storeDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (storeDetail.parkingYn == true)
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: CanParkingTag(),
          ),

        if (storeDetail.animalYn == true)
          const Padding(padding: EdgeInsets.only(left: 12), child: PetTag()),
        if (storeDetail.tumblerYn == true)
          const Padding(
            padding: EdgeInsets.only(left: 12),

            child: DiscountTumblerTag(),
          ),
      ],
    );
  }
}
