import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/saved_store_list.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar_right_item.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/global/user_store/user_store_list_view_model.dart';
import 'package:frontend_mobile/presentation/my_page/user_store/my_user_store_list_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/widget/default_error.dart';
import 'package:frontend_mobile/presentation/widget/desserbee_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

class MyUserStoreListView extends ConsumerStatefulWidget {
  const MyUserStoreListView({super.key});

  @override
  ConsumerState<MyUserStoreListView> createState() =>
      _MyUserStoreListViewState();
}

class _MyUserStoreListViewState extends ConsumerState<MyUserStoreListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final UserState userState = ref.read(userViewModelProvider);
      ref
          .read(userStoreListViewModelProvider.notifier)
          .getUserStoreListAll(userUuid: userState.data.userUuid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final UserState userState = ref.watch(userViewModelProvider);

    final MyUserStoreListViewModel viewmodel = ref.read(
      myUserStoreListViewModelProvider.notifier,
    );
    final UserStoreListState userStoreListState = ref.watch(
      userStoreListViewModelProvider,
    );
    final UserStoreListViewModel userStoreListViewModel = ref.read(
      userStoreListViewModelProvider.notifier,
    );

    final MyUserStoreListState state = ref.watch(
      myUserStoreListViewModelProvider,
    );

    ref.listen(
      myUserStoreListViewModelProvider.select(
        (MyUserStoreListState state) => state.deleteUserStoreListStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          final UserState userState = ref.read(userViewModelProvider);
          userStoreListViewModel.getUserStoreListAll(
            userUuid: userState.data.userUuid,
          );
        }
      },
    );

    // TODO: 로딩 UI 개선 필요
    if (userStoreListState.getUserStoreListAllStatus.isLoading) {
      return const Scaffold(
        appBar: CustomSubTopBar(title: '찜한 가게', actions: <Widget>[]),
        primary: false,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // TODO: 에러 UI 개선 필요 (현재는 임의로 설정함)
    if (userStoreListState.getUserStoreListAllStatus.isFailure) {
      return Scaffold(
        appBar: const CustomSubTopBar(
          title: '찜한 가게',
          primary: false,
          actions: <Widget>[],
        ),
        bottomNavigationBar: const DesserbeeBottomNavigation(),
        body: DefaultError(
          onRetry: () {
            userStoreListViewModel.getUserStoreListAll(
              userUuid: userState.data.userUuid,
            );
          },
        ),
      );
    }

    return CustomLoadingOverlay(
      isLoading:
          userStoreListState.getUserStoreListAllStatus.isLoading ||
          state.deleteUserStoreListStatus.isLoading,
      child: GestureDetector(
        onTap: () {
          userStoreListViewModel.invisibleAllOptionMenu();
        },
        child: Scaffold(
          appBar: const CustomSubTopBar(
            title: '찜한 가게',
            primary: false,
            actions: <Widget>[],
          ),
          backgroundColor: ScaleColorConfig.neutral100,
          body: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPinnedToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 6,
                      right: 16,
                      left: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: colorScheme.outlineVariant),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '전체 리스트',
                          style: textTheme.titleMedium?.copyWith(
                            color: ScaleColorConfig.primary20,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${userStoreListState.userStoreLists.length}',
                          style: textTheme.titleMedium?.copyWith(
                            color: ScaleColorConfig.success50,
                          ),
                        ),
                        const Spacer(),
                        if (userStoreListState.userStoreLists.isNotEmpty)
                          CustomOutlineButton.xSmall(
                            label: '새 리스트 추가',
                            onPressed: () async {
                              final Object? result = await context.pushNamed(
                                AppRoutes.addUserStoreList.name,
                              );

                              if (result == true && context.mounted) {
                                _showSuccessAddStoreList(context, ref);
                                final UserState userState = ref.read(
                                  userViewModelProvider,
                                );
                                await userStoreListViewModel
                                    .getUserStoreListAll(
                                      userUuid: userState.data.userUuid,
                                    );
                              }
                            },
                            svg: Assets.icon.system.addCircleLine,
                          ),
                      ],
                    ),
                  ),
                ),
                if (userStoreListState.userStoreLists.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 74),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '아직 찜한 리스트가 없어요\n새로운 리스트를 추가해보는 건 어떠세요?',
                            style: textTheme.bodyMedium?.copyWith(
                              color: ScaleColorConfig.neutral30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          CustomOutlineButton.xSmall(
                            label: '새 리스트 추가',
                            onPressed: () async {
                              final Object? result = await context.pushNamed(
                                AppRoutes.addUserStoreList.name,
                              );

                              if (result == true && context.mounted) {
                                _showSuccessAddStoreList(context, ref);
                                final UserState userState = ref.read(
                                  userViewModelProvider,
                                );
                                await userStoreListViewModel
                                    .getUserStoreListAll(
                                      userUuid: userState.data.userUuid,
                                    );
                              }
                            },
                            svg: Assets.icon.system.addCircleLine,
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      final UserStoreListModel userStoreList =
                          userStoreListState.userStoreLists[index];

                      final ({bool isOptionMenuVisible, int listId})
                      userStoreListOptionVisible = userStoreListState
                          .userStoreListOptionMenuVisible
                          .firstWhere(
                            (({bool isOptionMenuVisible, int listId}) e) =>
                                e.listId == userStoreList.listId,
                          );
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: CustomSavedStoreListItem.withOptionMenus(
                              leftIconColor:
                                  StoreListIconColor.values
                                      .firstWhere(
                                        (StoreListIconColor e) =>
                                            e.id == userStoreList.iconColorId,
                                      )
                                      .color,
                              name: userStoreList.listName,
                              storeLength: userStoreList.storeData?.length ?? 0,

                              optionMenus: <CustomOptionMenu>[
                                CustomOptionMenu(
                                  svg: Assets.icon.editor.pencil1Line,
                                  text: '수정하기',
                                  onTap: () async {
                                    userStoreListViewModel
                                        .invisibleAllOptionMenu();
                                    final Object? result = await context
                                        .pushNamed(
                                          AppRoutes.updateUserStoreList.name,
                                          pathParameters: <String, String>{
                                            'listId':
                                                userStoreList.listId.toString(),
                                          },
                                          queryParameters: <String, String>{
                                            'listName': userStoreList.listName,
                                            'iconColorId':
                                                userStoreList.iconColorId
                                                    .toString(),
                                          },
                                        );

                                    if (result == true) {
                                      final UserState userState = ref.read(
                                        userViewModelProvider,
                                      );
                                      await userStoreListViewModel
                                          .getUserStoreListAll(
                                            userUuid: userState.data.userUuid,
                                          );
                                    }
                                  },
                                ),
                                CustomOptionMenu(
                                  svg: Assets.icon.system.closeCircleLine,
                                  text: '삭제하기',
                                  onTap: () {
                                    userStoreListViewModel
                                        .invisibleAllOptionMenu();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CustomDialog.basic(
                                          title: '리스트를 삭제하시겠어요?',
                                          description:
                                              '삭제한 리스트의 가게는 더이상\n지도에 표시되지않습니다.',
                                          primaryButton: CustomDialogButton(
                                            text: '삭제하기',
                                            warning: true,
                                            onTap: () {
                                              viewmodel.deleteUserStoreList(
                                                listId: userStoreList.listId,
                                              );
                                              context.pop();
                                            },
                                          ),
                                          secondaryButton: CustomDialogButton(
                                            text: '취소',
                                            onTap: () {
                                              context.pop();
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                              optionMenusVisible:
                                  userStoreListOptionVisible
                                      .isOptionMenuVisible,
                              onOptionMenusTap: () {
                                userStoreListViewModel
                                    .updateStoreListOptionMenuVisible(
                                      listId: userStoreListOptionVisible.listId,
                                      isVisible: true,
                                    );
                              },
                              onTap: () {
                                context.pushNamed(
                                  AppRoutes.storesByUserStoreList.name,
                                  pathParameters: <String, String>{
                                    'listId': userStoreList.listId.toString(),
                                  },
                                  queryParameters: <String, String>{
                                    'listName': userStoreList.listName,
                                  },
                                );
                              },
                            ),
                          ),
                          Divider(color: colorScheme.outlineVariant, height: 1),
                        ],
                      );
                    }, childCount: userStoreListState.userStoreLists.length),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessAddStoreList(BuildContext context, WidgetRef ref) {
    final ToastManager toastManager = ref.read(toastManagerProvider);
    toastManager.show(
      context: context,
      toastWidget: CustomSnackBar(
        description: '새 리스트 추가를 완료했습니다',
        actionButton: SnackBarActionButton(
          onTap: () {
            toastManager.remove();
          },
          label: '닫기',
        ),
      ),
    );
  }
}
