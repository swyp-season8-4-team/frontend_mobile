import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/saved_store_list.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/global/user_store/user_store_list_view_model.dart';
import 'package:frontend_mobile/presentation/map/stores_by_user_store_list/stores_by_user_store_list_view_model.dart';
import 'package:frontend_mobile/presentation/map/stores_by_user_store_list/update/update_store_to_user_store_list_view_model.dart';
import 'package:go_router/go_router.dart';

class UpdateStoreToUserStoreListView extends ConsumerStatefulWidget {
  const UpdateStoreToUserStoreListView({
    required this.storeUuid,
    required this.storeName,
    required this.listId,
    super.key,
  });
  final String storeUuid;
  final String storeName;

  // 가게가 저장되어있던 리스트의 id
  final int listId;

  @override
  ConsumerState<UpdateStoreToUserStoreListView> createState() =>
      _UpdateStoreToUserStoreListViewState();
}

class _UpdateStoreToUserStoreListViewState
    extends ConsumerState<UpdateStoreToUserStoreListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final UserStoreListState userStoreListState = ref.watch(
        userStoreListViewModelProvider,
      );

      final UpdateStoreToUserStoreListViewModel viewmodel = ref.read(
        updateStoreToUserStoreListViewModelProvider.notifier,
      );

      final List<int> filteredStoreListIds =
          userStoreListState.userStoreLists
              .where(
                (UserStoreListModel e) =>
                    e.storeData != null &&
                    e.storeData!.firstWhereOrNull(
                          (UserStoreDataModel e) =>
                              e.storeUuid == widget.storeUuid,
                        ) !=
                        null,
              )
              .map((UserStoreListModel e) => e.listId)
              .toList();

      viewmodel.initList(listIds: filteredStoreListIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      updateStoreToUserStoreListViewModelProvider.select(
        (UpdateStoreToUserStoreListState state) =>
            state.updateStoreToUserStoreListStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          final UserState userState = ref.read(userViewModelProvider);
          ref
              .read(userStoreListViewModelProvider.notifier)
              .getUserStoreListAll(userUuid: userState.data.userUuid);
          ref
              .read(storesByUserStoreListViewModelProvider.notifier)
              .getStores(listId: widget.listId);
          context.pop(true);
        }
      },
    );

    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final UserStoreListState userStoreListState = ref.watch(
      userStoreListViewModelProvider,
    );

    final UpdateStoreToUserStoreListState state = ref.watch(
      updateStoreToUserStoreListViewModelProvider,
    );

    final UpdateStoreToUserStoreListViewModel viewmodel = ref.read(
      updateStoreToUserStoreListViewModelProvider.notifier,
    );

    return CustomLoadingOverlay(
      isLoading: state.updateStoreToUserStoreListStatus.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(
          title: '',
          actions: <Widget>[],
          primary: false,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            top: 55,
            bottom: MediaQuery.of(context).padding.bottom + 30,
          ),
          color: ScaleColorConfig.surface90,
          child: Row(
            children: <Widget>[
              const SizedBox(width: 16),
              Expanded(
                child: CustomOutlineButton.medium(
                  label: '취소',
                  onPressed: () {
                    context.pop();
                  },
                  width: 50,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomFillButton.medium(
                  label: state.canDeleteAll ? '저장삭제' : '저장',
                  width: 50,
                  onPressed: () {
                    final UserState userState = ref.read(userViewModelProvider);
                    viewmodel.updateStoreToUserStoreList(
                      storeUuid: widget.storeUuid,
                      userPreferences: userState.data.preferences,
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black.withAlpha(25)),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: colorScheme.onInverseSurface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            widget.storeName,
                            style: textTheme.titleMedium?.copyWith(
                              color: ScaleColorConfig.primary10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Row(
                        children: <Widget>[
                          // TODO: 타이포 그래피 적용 필요
                          const Text(
                            '전체 리스트',
                            style: TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.30,
                              letterSpacing: -0.21,
                            ),
                          ),
                          const SizedBox(width: 5),

                          // TODO: 타이포 그래피 적용 필요
                          Text(
                            userStoreListState.userStoreLists.length.toString(),
                            style: const TextStyle(
                              color:
                                  ScaleColorConfig
                                      .success50 /* System-Success-Success50-base */,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.30,
                              letterSpacing: -0.21,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    if (index == userStoreListState.userStoreLists.length) {
                      return const SizedBox(height: 130);
                    }

                    final UserStoreListModel storeList =
                        userStoreListState.userStoreLists[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: CustomSavedStoreListItem.withCheckbox(
                        leftIconColor:
                            StoreListIconColor.values
                                .firstWhere(
                                  (StoreListIconColor e) =>
                                      e.id == storeList.iconColorId,
                                )
                                .color,
                        name: storeList.listName,
                        storeLength: storeList.storeData?.length ?? 0,
                        onCheckboxTap: () {
                          viewmodel.updateList(listId: storeList.listId);
                        },
                        onTap: () {},
                        checked: state.listIds.contains(storeList.listId),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                      thickness: 1,
                      color: colorScheme.outlineVariant,
                    );
                  },
                  itemCount: userStoreListState.userStoreLists.length + 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
