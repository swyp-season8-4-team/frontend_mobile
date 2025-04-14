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
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_params.dart';
import 'package:frontend_mobile/presentation/dessert/dessert_board_view_model.dart';
import 'package:frontend_mobile/presentation/dessert/widget/list/dessert_list_card.dart';

class DessertBoard extends ConsumerStatefulWidget {
  const DessertBoard({super.key});

  @override
  ConsumerState<DessertBoard> createState() => _DessertBoardState();
}

class _DessertBoardState extends ConsumerState<DessertBoard> {
  final bool _floatingActionButtonDisabled = false;
  bool _bookMarkSelected = false;

  bool _isSelected = false;
  bool _isSelected1 = true;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;
  bool _isSelected7 = false;

  @override
  void initState() {
    super.initState();

    /// FIXME: 메이트 전체 조회 테스트 -> 나중에 지울 예정
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      ref
          .read(dessertBoardViewModelProvider.notifier)
          .getMate(params: GetMateParams());
    });
  }

  int _categoryCount({required String target}) {
    final DessertBoardState state = ref.watch(dessertBoardViewModelProvider);

    return state.backupData.mates
        .where((MateDetailModel element) => element.mateCategory == target)
        .toList()
        .length;
  }

  unselectHandler() {
    setState(() {
      _isSelected = false;
      _isSelected1 = false;
      _isSelected2 = false;
      _isSelected3 = false;
      _isSelected4 = false;
      _isSelected5 = false;
      _isSelected6 = false;
      _isSelected7 = false;
    });
  }

  bool selectSingle() {
    int count = 0;

    if (_isSelected1) count += 1;
    if (_isSelected2) count += 1;
    if (_isSelected3) count += 1;
    if (_isSelected4) count += 1;
    if (_isSelected5) count += 1;
    if (_isSelected6) count += 1;
    if (_isSelected7) count += 1;

    return count == 1 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    final DessertBoardState state = ref.watch(dessertBoardViewModelProvider);
    final ToastManager toastManager = ref.read(toastManagerProvider);
    final TopBarIcon icon = TopBarIcon();

    return CustomLoadingOverlay(
      isLoading: state.status.isLoading,
      child: Scaffold(
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
                            unselectHandler();

                            setState(() {
                              _isSelected = !_isSelected;
                            });

                            /// TODO: 파라미터 추가할 예정
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
                          number: state.backupData.mates.length,
                          onPressed: () {
                            if (!_isSelected1) {
                              ref
                                  .read(dessertBoardViewModelProvider.notifier)
                                  .getMate(params: GetMateParams());
                            }

                            unselectHandler();

                            setState(() {
                              _isSelected1 = true;
                            });
                          },
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '친목도모',
                          isSelected: _isSelected2,
                          number: _categoryCount(target: '친목도모'),
                          onPressed: () {
                            if (!_isSelected2) {
                              ref
                                  .read(dessertBoardViewModelProvider.notifier)
                                  .getMate(
                                    params: GetMateParams(mateCategoryId: 1),
                                  );
                            }

                            unselectHandler();

                            setState(() {
                              if (selectSingle()) {
                                _isSelected2 = true;
                              } else {
                                _isSelected2 = !_isSelected2;
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '사진맛집',
                          isSelected: _isSelected3,
                          number: _categoryCount(target: '사진맛집'),
                          onPressed: () {
                            if (!_isSelected3) {
                              ref
                                  .read(dessertBoardViewModelProvider.notifier)
                                  .getMate(
                                    params: GetMateParams(mateCategoryId: 2),
                                  );
                            }

                            unselectHandler();

                            setState(() {
                              if (selectSingle()) {
                                _isSelected3 = true;
                              } else {
                                _isSelected3 = !_isSelected3;
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '카공모임',
                          isSelected: _isSelected4,
                          number: _categoryCount(target: '카공모임'),
                          onPressed: () {
                            if (!_isSelected4) {
                              ref
                                  .read(dessertBoardViewModelProvider.notifier)
                                  .getMate(
                                    params: GetMateParams(mateCategoryId: 3),
                                  );
                            }

                            unselectHandler();

                            setState(() {
                              if (selectSingle()) {
                                _isSelected4 = true;
                              } else {
                                _isSelected4 = !_isSelected4;
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '건강맛집',
                          isSelected: _isSelected5,
                          number: _categoryCount(target: '건강맛집'),
                          onPressed: () {
                            if (!_isSelected5) {
                              ref
                                  .read(dessertBoardViewModelProvider.notifier)
                                  .getMate(
                                    params: GetMateParams(mateCategoryId: 4),
                                  );
                            }

                            unselectHandler();

                            setState(() {
                              if (selectSingle()) {
                                _isSelected5 = true;
                              } else {
                                _isSelected5 = !_isSelected5;
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '빵지순례',
                          isSelected: _isSelected6,
                          number: _categoryCount(target: '빵지순례'),
                          onPressed: () {
                            if (!_isSelected6) {
                              ref
                                  .read(dessertBoardViewModelProvider.notifier)
                                  .getMate(
                                    params: GetMateParams(mateCategoryId: 5),
                                  );
                            }

                            unselectHandler();

                            setState(() {
                              if (selectSingle()) {
                                _isSelected6 = true;
                              } else {
                                _isSelected6 = !_isSelected6;
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '카페투어',
                          isSelected: _isSelected7,
                          number: _categoryCount(target: '카페투어'),
                          onPressed: () {
                            if (!_isSelected7) {
                              ref
                                  .read(dessertBoardViewModelProvider.notifier)
                                  .getMate(
                                    params: GetMateParams(mateCategoryId: 6),
                                  );
                            }

                            unselectHandler();

                            setState(() {
                              _isSelected7 = !_isSelected7;
                            });
                          },
                        ),
                        const SizedBox(width: 6),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Expanded(
                    child: ListView.separated(
                      itemCount: state.data.mates.length,
                      itemBuilder: (BuildContext context, int index) {
                        final MateDetailModel mate = state.data.mates[index];

                        return DessertListCard(
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
                          mate: mate,
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 6),
                    ),
                  ),

                  // Expanded(
                  //   /// TODO: ListView.builder로 수정
                  //   child: ListView(
                  //     children: <Widget>[
                  //       DessertListCard(
                  //         bookmarkSelected: _bookMarkSelected,
                  //         onBookMarkTap: () {
                  //           setState(() {
                  //             _bookMarkSelected = !_bookMarkSelected;
                  //           });

                  //           toastManager.show(
                  //             context: context,
                  //             aboveBottomNavigation: true,
                  //             toastWidget: CustomSnackBar(
                  //               description:
                  //                   _bookMarkSelected
                  //                       ? '디저트 메이트 북마크가 완료되었습니다'
                  //                       : '북마크가 해제되었습니다',

                  //               actionButton: SnackBarActionButton(
                  //                 /// TODO: 확인 눌렀을 때 이동시켜야 함
                  //                 onTap: () {},
                  //                 label: '확인',
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //         onCardTap: () {},
                  //       ),
                  //       const SizedBox(height: 6),

                  //       DessertListCard(
                  //         bookmarkSelected: false,
                  //         onBookMarkTap: () {},
                  //         onCardTap: () {},
                  //       ),
                  //       const SizedBox(height: 6),

                  //       DessertListCard(
                  //         bookmarkSelected: false,
                  //         onBookMarkTap: () {},
                  //         onCardTap: () {},
                  //       ),
                  //       const SizedBox(height: 6),

                  //       DessertListCard(
                  //         bookmarkSelected: false,
                  //         onBookMarkTap: () {},
                  //         onCardTap: () {},
                  //       ),
                  //       const SizedBox(height: 6),

                  //       DessertListCard(
                  //         bookmarkSelected: false,
                  //         onBookMarkTap: () {},
                  //         onCardTap: () {},
                  //       ),
                  //       const SizedBox(height: 6),

                  //       DessertListCard(
                  //         bookmarkSelected: false,
                  //         onBookMarkTap: () {},
                  //         onCardTap: () {},
                  //       ),
                  //       const SizedBox(height: 6),

                  //       DessertListCard(
                  //         bookmarkSelected: false,
                  //         onBookMarkTap: () {},
                  //         onCardTap: () {},
                  //       ),
                  //       const SizedBox(height: 6),

                  //       DessertListCard(
                  //         bookmarkSelected: false,
                  //         onBookMarkTap: () {},
                  //         onCardTap: () {},
                  //       ),
                  //       const SizedBox(height: 6),

                  //       DessertListCard(
                  //         bookmarkSelected: false,
                  //         onBookMarkTap: () {},
                  //         onCardTap: () {},
                  //       ),
                  //       const SizedBox(height: 6),
                  //     ],
                  //   ),
                  // ),
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
      ),
    );
  }
}
