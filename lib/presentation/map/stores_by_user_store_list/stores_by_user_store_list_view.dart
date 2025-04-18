import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/presentation/map/map_view_model.dart';
import 'package:frontend_mobile/presentation/map/stores_by_user_store_list/stores_by_user_store_list_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

part 'local_widget/store_card.dart';
part 'local_widget/failure.dart';
part 'local_widget/stores_length.dart';
part 'local_widget/store_list.dart';

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
    ref.listen(
      storesByUserStoreListViewModelProvider.select(
        (StoresByUserStoreListState state) => state.deleteStoreStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          ref
              .read(storesByUserStoreListViewModelProvider.notifier)
              .getStores(listId: widget.listId);
        }
      },
    );

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
      return _Failure(listId: widget.listId);
    }

    return CustomLoadingOverlay(
      isLoading:
          state.getAllPreferencesStatus.isLoading ||
          state.getStoresByUserStoreListStatus.isLoading ||
          state.deleteStoreStatus.isLoading,
      child: GestureDetector(
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
                const _StoresLength(),
                if (state.storeList?.storeData != null) const _StoreList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
