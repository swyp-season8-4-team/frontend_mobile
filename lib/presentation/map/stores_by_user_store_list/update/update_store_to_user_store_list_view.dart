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
import 'package:frontend_mobile/domain/model/user_store/user_store_list_detail_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/presentation/map/map_view_model.dart';
import 'package:frontend_mobile/presentation/map/stores_by_user_store_list/stores_by_user_store_list_view_model.dart';

class UpdateStoreToUserStoreListView extends ConsumerWidget {
  const UpdateStoreToUserStoreListView({required this.storeUuid, super.key});
  final String storeUuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);

    final StoresByUserStoreListState storesByUserStoreListState = ref.watch(
      storesByUserStoreListViewModelProvider,
    );

    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final UserStoreDetailModel? storeDetail = storesByUserStoreListState
        .storeList
        ?.storeData
        ?.firstWhereOrNull(
          (UserStoreDetailModel e) => e.storeUuid == storeUuid,
        );

    return Scaffold(
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
                onPressed: () {},
                width: 50,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomFillButton.medium(
                label: '저장',
                width: 50,
                onPressed: () {},
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
                          storeDetail?.storeName ?? '',
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
                          mapState.userStoreLists.length.toString(),
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
                  if (index == mapState.userStoreLists.length) {
                    return const SizedBox(height: 130);
                  }

                  final UserStoreListModel storeList =
                      mapState.userStoreLists[index];
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
                      onCheckboxTap: () {},
                      onTap: () {},
                      // TODO: 수정 필요
                      checked: false,
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
                itemCount: mapState.userStoreLists.length + 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
