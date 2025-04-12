import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/floating_action_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/suggestive_chip.dart';
import 'package:frontend_mobile/common/design_system/component/navigation_bar/navigation_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar_right_item.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/presentation/dessert/widget/list/dessert_list_card.dart';

class DessertMain extends ConsumerStatefulWidget {
  const DessertMain({super.key});

  @override
  ConsumerState<DessertMain> createState() => _DessertMainState();
}

class _DessertMainState extends ConsumerState<DessertMain> {
  final bool _floatingActionButtonDisabled = false;
  bool _bookMarkSelected = false;
  bool _isSelected = false;
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  final bool _isSelected3 = false;

  @override
  Widget build(BuildContext context) {
    final ToastManager toastManager = ref.read(toastManagerProvider);
    final TopBarIcon icon = TopBarIcon();

    return Scaffold(
      appBar: CustomSubTopBar(
        title: '디저트 메이트',
        actions: TopBarIcon.toList(<Widget>[
          icon.bookMark(onTap: () {}),
          icon.search(onTap: () {}),
        ]),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      CustomSuggestiveChip(
                        label: '모집중',
                        isSelected: _isSelected,
                        labelColor: ScaleColorConfig.error40,
                        onPressed: () {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                      ),

                      const SizedBox(width: 10),
                      Container(
                        width: 1,
                        height: 18,
                        color: ScaleColorConfig.neutral50,
                      ),
                      const SizedBox(width: 10),

                      CustomSuggestiveChip(
                        label: '전체',
                        isSelected: _isSelected1,
                        number: 100,
                        onPressed: () {
                          setState(() {
                            _isSelected1 = !_isSelected1;
                          });
                        },
                      ),
                      const SizedBox(width: 6),

                      CustomSuggestiveChip(
                        label: '친목도모',
                        isSelected: _isSelected2,
                        number: 10,
                        onPressed: () {
                          setState(() {
                            _isSelected2 = !_isSelected2;
                          });
                        },
                      ),
                      const SizedBox(width: 6),

                      CustomSuggestiveChip(
                        label: '카공모임',
                        isSelected: _isSelected3,
                        number: 9,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 6),

                      CustomSuggestiveChip(
                        label: '테스트1',
                        isSelected: _isSelected3,
                        number: 10,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 6),

                      CustomSuggestiveChip(
                        label: '테스트1',
                        isSelected: _isSelected3,
                        number: 10,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 6),

                      CustomSuggestiveChip(
                        label: '테스트1',
                        isSelected: _isSelected3,
                        number: 10,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 6),

                      CustomSuggestiveChip(
                        label: '테스트1',
                        isSelected: _isSelected3,
                        number: 10,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 6),

                      CustomSuggestiveChip(
                        label: '테스트1',
                        isSelected: _isSelected3,
                        number: 10,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 6),

                      CustomSuggestiveChip(
                        label: '테스트1',
                        isSelected: _isSelected3,
                        number: 10,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 6),

                      CustomSuggestiveChip(
                        label: '테스트1',
                        isSelected: _isSelected3,
                        number: 10,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                Expanded(
                  /// TODO: ListView.builder로 수정
                  child: ListView(
                    children: <Widget>[
                      DessertListCard(
                        bookmarkSelected: _bookMarkSelected,
                        onBookMarkTap: () {
                          setState(() {
                            _bookMarkSelected = !_bookMarkSelected;
                          });

                          toastManager.show(
                            context: context,
                            aboveBottomNavigation: true,
                            toastWidget: CustomSnackBar(
                              description:
                                  _bookMarkSelected
                                      ? '디저트 메이트 북마크가 완료되었습니다'
                                      : '북마크가 해제되었습니다',

                              actionButton: SnackBarActionButton(
                                /// TODO: 확인 눌렀을 때 이동시켜야 함
                                onTap: () {},
                                label: '확인',
                              ),
                            ),
                          );
                        },
                        onCardTap: () {},
                      ),
                      const SizedBox(height: 6),

                      DessertListCard(
                        bookmarkSelected: false,
                        onBookMarkTap: () {},
                        onCardTap: () {},
                      ),
                      const SizedBox(height: 6),

                      DessertListCard(
                        bookmarkSelected: false,
                        onBookMarkTap: () {},
                        onCardTap: () {},
                      ),
                      const SizedBox(height: 6),

                      DessertListCard(
                        bookmarkSelected: false,
                        onBookMarkTap: () {},
                        onCardTap: () {},
                      ),
                      const SizedBox(height: 6),

                      DessertListCard(
                        bookmarkSelected: false,
                        onBookMarkTap: () {},
                        onCardTap: () {},
                      ),
                      const SizedBox(height: 6),

                      DessertListCard(
                        bookmarkSelected: false,
                        onBookMarkTap: () {},
                        onCardTap: () {},
                      ),
                      const SizedBox(height: 6),

                      DessertListCard(
                        bookmarkSelected: false,
                        onBookMarkTap: () {},
                        onCardTap: () {},
                      ),
                      const SizedBox(height: 6),

                      DessertListCard(
                        bookmarkSelected: false,
                        onBookMarkTap: () {},
                        onCardTap: () {},
                      ),
                      const SizedBox(height: 6),

                      DessertListCard(
                        bookmarkSelected: false,
                        onBookMarkTap: () {},
                        onCardTap: () {},
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 16,
            right: 16,
            child: CustomFloatingActionButton(
              onPressed: () {},
              disabled: _floatingActionButtonDisabled,
              svg: Assets.icon.editor.pencil2Line.svg(
                colorFilter: ColorFilter.mode(
                  !_floatingActionButtonDisabled
                      ? ScaleColorConfig.primary80
                      : ScaleColorConfig.neutral50,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        list: <NavigationBarType>[
          NavigationBarType(
            svg: Assets.icon.dessert.donutLine,
            label: '커뮤니티',
            onTap: () {},
          ),
          NavigationBarType(
            svg: Assets.icon.map.mapLine,
            label: '지도',
            onTap: () {},
          ),
          NavigationBarType(
            svg: Assets.icon.user.user3Line,
            label: 'MY',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
