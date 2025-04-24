import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/store_list_color_chip.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/map/map_view_model.dart';
import 'package:frontend_mobile/presentation/map/user_store/update/update_user_store_list_view_model.dart';
import 'package:go_router/go_router.dart';

class UpdateUserStoreListView extends ConsumerStatefulWidget {
  const UpdateUserStoreListView({required this.listId, super.key});
  final int listId;

  @override
  ConsumerState<UpdateUserStoreListView> createState() =>
      _UpdateUserStoreListViewState();
}

class _UpdateUserStoreListViewState
    extends ConsumerState<UpdateUserStoreListView> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final MapState mapState = ref.read(mapViewModelProvider);

      final UserStoreListModel storeList = mapState.userStoreLists.firstWhere(
        (UserStoreListModel e) => e.listId == widget.listId,
      );
      final UpdateUserStoreListViewModel viewmodel = ref.read(
        updateUserStoreListViewModelProvider.notifier,
      );

      viewmodel.updateListName(newListName: storeList.listName);
      viewmodel.updateIconColorId(newIconColorId: storeList.iconColorId);

      _textEditingController.text = storeList.listName;
    });
  }

  final int _maxLength = 20;
  final TopBarIcon _icon = TopBarIcon();

  @override
  Widget build(BuildContext context) {
    final UpdateUserStoreListState state = ref.watch(
      updateUserStoreListViewModelProvider,
    );
    final UpdateUserStoreListViewModel viewmodel = ref.read(
      updateUserStoreListViewModelProvider.notifier,
    );
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(
      updateUserStoreListViewModelProvider.select(
        (UpdateUserStoreListState state) => state.updateUserStoreListStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          final UserState userState = ref.read(userViewModelProvider);
          ref
              .read(mapViewModelProvider.notifier)
              .getUserStoreListAll(userUuid: userState.data.userUuid);
          context.pop(true);
        }
      },
    );

    return CustomLoadingOverlay(
      isLoading: state.updateUserStoreListStatus.isLoading,
      child: Scaffold(
        appBar: CustomSubTopBar(
          primary: false,
          title: '리스트 수정',
          actions: const <Widget>[],
          leading: _icon.leftLine(
            onTap: () async {
              if (state.newListName != null && state.newListName!.isNotEmpty) {
                final dynamic result = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog.basic(
                      description: '아직 작성 중인 내용이 있어요.\n페이지를 나가시겠어요?',
                      primaryButton: CustomDialogButton(
                        text: '작성하기',
                        onTap: () {
                          context.pop(false);
                        },
                      ),
                      secondaryButton: CustomDialogButton(
                        text: '나가기',
                        onTap: () {
                          context.pop(true);
                        },
                      ),
                    );
                  },
                );

                if (result == true && context.mounted) {
                  context.pop();
                }
              } else {
                context.pop();
              }
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Text(
                          '색상선택',
                          style: textTheme.titleSmall?.copyWith(
                            color: ScaleColorConfig.neutral30,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '*',
                          style: textTheme.labelLarge?.copyWith(
                            color: ScaleColorConfig.error60,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),

                    Row(
                      children: <Widget>[
                        ...StoreListIconColor.values.map(
                          (StoreListIconColor e) => Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: StoreListColorChip(
                              color: e.color,
                              isSelected: state.newIconColorId == e.id,
                              onTap: () {
                                viewmodel.updateIconColorId(
                                  newIconColorId: e.id,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 23),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                '새 리스트 이름',
                                style: textTheme.titleSmall?.copyWith(
                                  color: ScaleColorConfig.neutral30,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '*',
                                style: textTheme.labelLarge?.copyWith(
                                  color: ScaleColorConfig.error60,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: '${state.newListName?.length ?? '0'}',
                                style: textTheme.labelLarge?.copyWith(
                                  color: ScaleColorConfig.neutral30,
                                ),
                              ),
                              TextSpan(
                                text: '/$_maxLength',
                                style: textTheme.labelLarge?.copyWith(
                                  color: ScaleColorConfig.neutral50,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),

                    CustomInputBox(
                      maxLength: 20,
                      onChanged: (String val) {
                        viewmodel.updateListName(newListName: val);
                      },
                      controller: _textEditingController,
                      error: state.updateUserStoreListStatus.isFailure,
                      errorText: state.updateUserStoreListException.message,
                      hintText: '새 리스트 이름을 입력해주세요',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 30,
                ),

                child: CustomFillButton.large(
                  label: '완료',
                  onPressed:
                      state.newListName?.isNotEmpty == true
                          ? () {
                            viewmodel.updateUserStoreList(
                              listId: widget.listId,
                            );
                          }
                          : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
