import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/store_list_color_chip.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/foundation.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading_overlay.dart';
import 'package:frontend_mobile/presentation/map/add_user_store_list/add_user_store_list_view_model.dart';
import 'package:go_router/go_router.dart';

class AddUserStoreListView extends ConsumerStatefulWidget {
  const AddUserStoreListView({super.key});

  @override
  ConsumerState<AddUserStoreListView> createState() =>
      _AddUserStoreListViewState();
}

class _AddUserStoreListViewState extends ConsumerState<AddUserStoreListView> {
  final int _maxLength = 20;
  final TopBarIcon _icon = TopBarIcon();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final AddUserStoreListState state = ref.watch(
      addUserStoreListViewModelProvider,
    );

    final AddUserStoreListViewModel viewmodel = ref.read(
      addUserStoreListViewModelProvider.notifier,
    );

    ref.listen(
      addUserStoreListViewModelProvider.select(
        (AddUserStoreListState state) => state.addUserStoreListStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          context.pop();
        }
      },
    );

    return CustomLoadingOverlay(
      isLoading: state.addUserStoreListStatus.isLoading,
      child: Scaffold(
        appBar: CustomSubTopBar(
          primary: false,
          title: '새 리스트 추가',
          actions: const <Widget>[],
          leading: _icon.leftLine(
            onTap: () async {
              if (state.listName != null && state.listName!.isNotEmpty) {
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

                    // TODO: 색깔 고를 수 있도록 수정 필요
                    Row(
                      children: <Widget>[
                        ...<Color>[
                          colorScheme.accentYellow,
                          colorScheme.accentOrange,
                          colorScheme.accentGreen,
                          colorScheme.accentOcean,
                        ].map(
                          (Color e) =>
                              StoreListColorChip(color: e, onTap: () {}),
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
                                text: '${state.listName?.length ?? '0'}',
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

                    // TODO: 리스트 이름 중복 에러 메세지 표시 필요
                    CustomInputBox(
                      maxLength: 20,
                      onChanged: (String val) {
                        viewmodel.updateListName(listName: val);
                      },
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
                  onPressed: () {
                    // TODO: userUuid 값 수정 예정
                    viewmodel.addUserStoreList(userUuid: '1234');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
