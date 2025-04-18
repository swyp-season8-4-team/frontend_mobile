import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/presentation/map/map_view_model.dart';
import 'package:frontend_mobile/presentation/map/stores_by_user_store_list/stores_by_user_store_list_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

part 'local_widget/store_card.dart';

class StoresByUserStoreListView extends ConsumerStatefulWidget {
  const StoresByUserStoreListView({required this.listId, super.key});
  final int listId;

  @override
  ConsumerState<StoresByUserStoreListView> createState() =>
      _StoresByUserStoreListViewState();
}

class _StoresByUserStoreListViewState
    extends ConsumerState<StoresByUserStoreListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StoresByUserStoreListViewModel viewmodel = ref.read(
        storesByUserStoreListViewModelProvider.notifier,
      );
      viewmodel.getPreferences();
      viewmodel.getStores(listId: widget.listId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserStoreListModel storeList = ref
        .watch(mapViewModelProvider)
        .userStores
        .firstWhere((UserStoreListModel e) => e.listId == widget.listId);

    final StoresByUserStoreListState state = ref.watch(
      storesByUserStoreListViewModelProvider,
    );

    final StoresByUserStoreListViewModel viewmodel = ref.read(
      storesByUserStoreListViewModelProvider.notifier,
    );

    final TextTheme textTheme = Theme.of(context).textTheme;

    // TODO: 페이지 전환 에러 UI 적용 필요
    if (state.isFirstLoading) {
      return Scaffold(
        appBar: CustomSubTopBar(
          title: storeList.listName,
          actions: const <Widget>[],
          primary: false,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (state.isFailure) {
      return Scaffold(
        appBar: CustomSubTopBar(
          title: storeList.listName,
          actions: const <Widget>[],
          primary: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 198),
          child: Center(
            child: Column(
              children: <Widget>[
                Assets.icon.system.warningFill.svg(
                  colorFilter: const ColorFilter.mode(
                    ScaleColorConfig.primary80,
                    BlendMode.srcIn,
                  ),
                  width: 51.4,
                  height: 51.4,
                ),
                const SizedBox(height: 8.29),
                Text(
                  '일시적인 오류로\n정보를 불러올 수 없어요',
                  style: textTheme.titleMedium?.copyWith(
                    color: ScaleColorConfig.primary20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),
                CustomPillOutlineButton.medium(
                  width: 126,
                  label: '다시 시도',
                  onPressed: () {
                    viewmodel.getPreferences();
                    viewmodel.getStores(listId: widget.listId);
                  },
                  isSelected: false,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        viewmodel.invisibleAllStoreOptionMenu();
      },
      child: Scaffold(
        appBar: CustomSubTopBar(
          title: storeList.listName,
          actions: const <Widget>[],
          primary: false,
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPinnedToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: ScaleColorConfig.neutral90,
                  child: Row(
                    children: <Widget>[
                      // TODO: 타이포그래피 적용 필요
                      const Text(
                        '전체',
                        style: TextStyle(
                          color: Color(0xFF393939),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.30,
                          letterSpacing: -0.21,
                        ),
                      ),
                      const SizedBox(width: 5),

                      // TODO: 타이포그래피 적용 필요
                      Text(
                        '${state.storeList?.storeData?.length ?? 0}',
                        style: const TextStyle(
                          color: ScaleColorConfig.success50,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.30,
                          letterSpacing: -0.21,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state.storeList?.storeData != null)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      final UserStoreModel store =
                          state.storeList!.storeData![index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            // FIXME: 지도를 통해 간략하게 조회한 후 상세 조회 페이지로 이동할 수 있어야함
                            context.pushNamed(
                              AppRoutes.storeDetail.name,
                              pathParameters: <String, String>{
                                'id': store.storeUuid,
                              },
                            );
                          },
                          child: _StoreCard(store: store),
                        ),
                      );
                    }, childCount: state.storeList!.storeData!.length),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
