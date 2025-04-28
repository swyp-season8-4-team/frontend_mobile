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
import 'package:frontend_mobile/presentation/map/store_detail/store_detail_view_model.dart';
import 'package:frontend_mobile/presentation/map/store_detail/user_store/add_store_to_user_store_list_view_model.dart';
import 'package:go_router/go_router.dart';

class AddStoreToUserStoreListView extends ConsumerStatefulWidget {
  const AddStoreToUserStoreListView({required this.storeUuid, super.key});
  final String storeUuid;

  @override
  ConsumerState<AddStoreToUserStoreListView> createState() =>
      _AddStoreToUserStoreListViewState();
}

class _AddStoreToUserStoreListViewState
    extends ConsumerState<AddStoreToUserStoreListView> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      addStoreToUserStoreListViewModelProvider.select(
        (AddStoreToUserStoreListState state) =>
            state.addStoreToUserStoreListStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          final UserState userState = ref.read(userViewModelProvider);
          ref
              .read(userStoreListViewModelProvider.notifier)
              .getUserStoreListAll(userUuid: userState.data.userUuid);
          context.pop();
        }
      },
    );

    final AddStoreToUserStoreListViewModel viewmodel = ref.read(
      addStoreToUserStoreListViewModelProvider.notifier,
    );

    final AddStoreToUserStoreListState state = ref.watch(
      addStoreToUserStoreListViewModelProvider,
    );

    final StoreDetailState storeDetailState = ref.watch(
      storeDetailViewModelProvider,
    );

    final UserStoreListState userStoreListState = ref.watch(
      userStoreListViewModelProvider,
    );

    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final List<UserStoreListModel> filteredStoreLists =
        userStoreListState.userStoreLists
            .where(
              (UserStoreListModel e) =>
                  e.storeData == null ||
                  e.storeData!.firstWhereOrNull(
                        (UserStoreDataModel e) =>
                            e.storeUuid == widget.storeUuid,
                      ) ==
                      null,
            )
            .toList();

    return CustomLoadingOverlay(
      isLoading: state.addStoreToUserStoreListStatus.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(
          title: '가게 찜하기',
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
                    viewmodel.updateList();
                  },
                  width: 50,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomFillButton.medium(
                  label: '저장',
                  width: 50,
                  disabled: state.listId == null,
                  onPressed: () {
                    final UserState userState = ref.read(userViewModelProvider);
                    viewmodel.addStoreToUserStoreList(
                      storeUuid: widget.storeUuid,
                      preferencesIds: userState.data.preferences,
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
                            storeDetailState.storeDetail!.name,
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
                            filteredStoreLists.length.toString(),
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
                    if (index == filteredStoreLists.length) {
                      return const SizedBox(height: 130);
                    }

                    final UserStoreListModel storeList =
                        filteredStoreLists[index];
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
                        checked: state.listId == storeList.listId,
                        onTap: () {},
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
                  itemCount: filteredStoreLists.length + 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
