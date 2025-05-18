import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/floating_action_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/suggestive_chip.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/navigation_bar/navigation_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar_right_item.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_params.dart';
import 'package:frontend_mobile/presentation/dessert/dessert_board_view_model.dart';
import 'package:frontend_mobile/presentation/dessert/widget/list/dessert_list_card.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/widget/desserbee_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

class DessertBoard extends ConsumerStatefulWidget {
  const DessertBoard({super.key});

  @override
  ConsumerState<DessertBoard> createState() => _DessertBoardState();
}

class _DessertBoardState extends ConsumerState<DessertBoard> {
  final int to = 1000;
  final bool _floatingActionButtonDisabled = false;
  // bool _bookMarkSelected = false;

  bool _isRecruit = false;
  int? mateCategoryId;

  /// 전체
  bool _isAll = true;

  /// 친목도모
  bool _isAmity = false;

  /// 사진맛집
  bool _isPhoto = false;

  /// 카공모임
  bool _isStudy = false;

  /// 건강맛집
  bool _isHealth = false;

  /// 빵지순례
  bool _isBread = false;

  /// 카페투어
  bool _isCafe = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      ref
          .read(dessertBoardViewModelProvider.notifier)
          .getMate(params: GetMateParams(to: to));
    });
  }

  int _categoryCount({required String target}) {
    final DessertBoardState state = ref.watch(dessertBoardViewModelProvider);

    return state.backupData.mates
        .where((MateDetailModel element) => element.mateCategory == target)
        .toList()
        .length;
  }

  void onUnselect() {
    _isAll = false;
    _isAmity = false;
    _isPhoto = false;
    _isStudy = false;
    _isHealth = false;
    _isBread = false;
    _isCafe = false;
  }

  void onRecruit() {
    setState(() {
      _isRecruit = !_isRecruit;
    });

    ref
        .read(dessertBoardViewModelProvider.notifier)
        .getMate(
          params: GetMateParams(
            mateCategoryId: mateCategoryId,
            recruit: _isRecruit ? true : null,
            to: to,
          ),
        );
  }

  void onCategory({required DessertBoardCategory category}) {
    onUnselect();

    switch (category) {
      case DessertBoardCategory.all:
        mateCategoryId = null;
        _isAll = !_isAll;
        break;

      case DessertBoardCategory.amity:
        mateCategoryId = 1;
        _isAmity = !_isAmity;
        break;

      case DessertBoardCategory.photo:
        mateCategoryId = 2;
        _isPhoto = !_isPhoto;
        break;

      case DessertBoardCategory.study:
        mateCategoryId = 3;
        _isStudy = !_isStudy;
        break;

      case DessertBoardCategory.health:
        mateCategoryId = 4;
        _isHealth = !_isHealth;
        break;

      case DessertBoardCategory.bread:
        mateCategoryId = 5;
        _isBread = !_isBread;
        break;

      case DessertBoardCategory.cafe:
        mateCategoryId = 6;
        _isCafe = !_isCafe;
        break;
    }

    ref
        .read(dessertBoardViewModelProvider.notifier)
        .getMate(
          params: GetMateParams(
            mateCategoryId: mateCategoryId,
            recruit: _isRecruit ? true : null,
            to: to,
          ),
        );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final DessertBoardState state = ref.watch(dessertBoardViewModelProvider);
    final ToastManager toastManager = ref.read(toastManagerProvider);
    final TopBarIcon _ = TopBarIcon();

    ref.listen(dessertBoardViewModelProvider, (_, DessertBoardState next) {
      switch (next.getMateStatus) {
        case Status.failure:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception.message,
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap: () => context.pop(),
                ),
              );
            },
          );
          break;
        default:
      }

      switch (next.updateMateBlockDataStatus) {
        case Status.success:
          toastManager.show(
            context: context,
            aboveBottomNavigation: true,
            toastWidget: CustomSnackBar(
              description: '${next.blockedUserNickname}님을 차단했습니다.',
              actionButton: SnackBarActionButton(onTap: () {}, label: '확인'),
            ),
          );
          break;

        default:
      }
    });

    return CustomLoadingOverlay(
      isLoading: state.getMateStatus.isLoading,
      child: Scaffold(
        appBar: CustomSubTopBar(
          title: '디저트 메이트',
          leading: const SizedBox.shrink(),
          actions: TopBarIcon.toList(<Widget>[
            // icon.bookMark(onTap: () {}),
            // icon.search(onTap: () {}),
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
                          isSelected: _isRecruit,
                          labelColor: ScaleColorConfig.error40,
                          onPressed: onRecruit,
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
                          isSelected: _isAll,
                          number: state.backupData.mates.length,
                          onPressed:
                              () => onCategory(
                                category: DessertBoardCategory.all,
                              ),
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '친목도모',
                          isSelected: _isAmity,
                          number: _categoryCount(target: '친목도모'),
                          onPressed:
                              () => onCategory(
                                category: DessertBoardCategory.amity,
                              ),
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '사진맛집',
                          isSelected: _isPhoto,
                          number: _categoryCount(target: '사진맛집'),
                          onPressed:
                              () => onCategory(
                                category: DessertBoardCategory.photo,
                              ),
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '카공모임',
                          isSelected: _isStudy,
                          number: _categoryCount(target: '카공모임'),
                          onPressed:
                              () => onCategory(
                                category: DessertBoardCategory.study,
                              ),
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '건강맛집',
                          isSelected: _isHealth,
                          number: _categoryCount(target: '건강맛집'),
                          onPressed:
                              () => onCategory(
                                category: DessertBoardCategory.health,
                              ),
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '빵지순례',
                          isSelected: _isBread,
                          number: _categoryCount(target: '빵지순례'),
                          onPressed:
                              () => onCategory(
                                category: DessertBoardCategory.bread,
                              ),
                        ),
                        const SizedBox(width: 6),

                        CustomSuggestiveChip(
                          label: '카페투어',
                          isSelected: _isCafe,
                          number: _categoryCount(target: '카페투어'),
                          onPressed:
                              () => onCategory(
                                category: DessertBoardCategory.cafe,
                              ),
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

                        if (mate.blockedByAuthorYn) {
                          return const SizedBox.shrink();
                        }

                        return DessertListCard(
                          bookmarkSelected: false,
                          onBookMarkTap: () {},
                          // onBookMarkTap: () {
                          //   setState(() {
                          //     _bookMarkSelected = !_bookMarkSelected;
                          //   });

                          //   toastManager.show(
                          //     context: context,
                          //     aboveBottomNavigation: true,
                          //     toastWidget: CustomSnackBar(
                          //       description:
                          //           _bookMarkSelected
                          //               ? '디저트 메이트 북마크가 완료되었습니다'
                          //               : '북마크가 해제되었습니다',

                          //       actionButton: SnackBarActionButton(
                          //         /// TODO: 확인 눌렀을 때 이동시켜야 함
                          //         onTap: () {},
                          //         label: '확인',
                          //       ),
                          //     ),
                          //   );
                          // },
                          onCardTap: () {
                            context.pushNamed(
                              AppRoutes.dessertPost.name,
                              extra: mate.mateUuid,
                            );
                          },
                          mate: mate,
                        );
                      },
                      separatorBuilder: (_, int index) {
                        final MateDetailModel mate = state.data.mates[index];

                        if (mate.blockedByAuthorYn) {
                          return const SizedBox.shrink();
                        }

                        return const SizedBox(height: 6);
                      },
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
                onPressed: () {
                  context.pushNamed(AppRoutes.dessertWriteStep1.name);
                },
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
        bottomNavigationBar: const DesserbeeBottomNavigation(
          currentItemType: NavigationItemType.mate,
        ),
      ),
    );
  }
}
