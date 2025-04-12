import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/input_chip.dart';
import 'package:frontend_mobile/common/design_system/component/search/search.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/foundation.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/model/search/popular_searchs_model.dart';
import 'package:intl/intl.dart';

class SearchStoreView extends StatefulWidget {
  const SearchStoreView({super.key});

  @override
  State<SearchStoreView> createState() => _SearchStoreViewState();
}

class _SearchStoreViewState extends State<SearchStoreView> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const CustomSubTopBar(title: '검색', actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Expanded(child: CustomSearch(onSubmitted: (String val) {})),
                  const SizedBox(width: 10),
                  CustomFillButton(
                    label: '검색',
                    primary: false,
                    width: 74,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 16,
                    right: 16,
                    bottom: 8,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '최근 검색어',
                        style: textTheme.titleSmall?.copyWith(
                          color: ScaleColorConfig.primary20,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          '전체삭제',
                          style: textTheme.labelLarge?.copyWith(
                            color: ScaleColorConfig.secondary30,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 28,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      const SizedBox(width: 16),
                      CustomInputChip(label: '검색어 1', onPressed: () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorScheme.onInverseSurface,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '인기 검색어',
                              style: textTheme.titleSmall?.copyWith(
                                color: ScaleColorConfig.primary20,
                              ),
                            ),
                            Text(
                              '${DateFormat('MM.dd').format(DateTime.now())} 업데이트',
                              // TODO: 타이포 그래피 적용 필요
                              style: const TextStyle(
                                color: ScaleColorConfig.neutral40,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                height: 1.30,
                                letterSpacing: -0.15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  _PopularSearch(
                                    search: PopularSearchModel(
                                      keyword: '검색어',
                                      searchCount: 23,
                                      rank: 1,
                                      difference: -2,
                                    ),
                                  ),
                                  _PopularSearch(
                                    search: PopularSearchModel(
                                      keyword: '검색어',
                                      searchCount: 23,
                                      rank: 2,
                                      difference: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(child: Column()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PopularSearch extends StatelessWidget {
  const _PopularSearch({required this.search});
  final PopularSearchModel search;

  @override
  Widget build(BuildContext context) {
    // TODO: 타이포 그래피 사용 필요
    const TextStyle rankTextStyle = TextStyle(
      color: ScaleColorConfig.primary20,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.20,
      letterSpacing: -0.18,
    );
    return Row(
      children: <Widget>[
        SizedBox(
          width: 21,
          child: Text(search.rank.toString(), style: rankTextStyle),
        ),

        Expanded(
          child: Text(
            search.keyword,
            style: rankTextStyle.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(width: 8),
        _buildDifference(context),
      ],
    );
  }

  Widget _buildDifference(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    // TODO: 타이포 그래피 사용 필요
    const TextStyle differenceTextStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.20,
      letterSpacing: -0.18,
    );
    if (search.difference > 0) {
      return Row(
        children: <Widget>[
          Assets.icon.arrow.a20x20ArrowUpFilled.svg(),
          Text(
            search.difference.abs().toString(),
            style: differenceTextStyle.copyWith(color: colorScheme.accentRed),
          ),
        ],
      );
    } else if (search.difference == 0) {
      return Text(
        'N',
        style: differenceTextStyle.copyWith(color: ScaleColorConfig.error50),
      );
    } else {
      return Row(
        children: <Widget>[
          Assets.icon.arrow.a20x20ArrowDownFilled.svg(),
          Text(
            search.difference.abs().toString(),
            style: differenceTextStyle.copyWith(color: colorScheme.accentBlue),
          ),
        ],
      );
    }
  }
}
