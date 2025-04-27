import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/text_field.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/get_mate_reply_params.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_params.dart';
import 'package:frontend_mobile/presentation/dessert/comment/dessert_comment_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:go_router/go_router.dart';

class DessertComment extends ConsumerStatefulWidget {
  const DessertComment({required this.mateUuid, super.key});

  final String mateUuid;

  @override
  ConsumerState<DessertComment> createState() => _DessertCommentState();
}

class _DessertCommentState extends ConsumerState<DessertComment> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _commentController.addListener(_onCommentRender);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(dessertCommentViewModelProvider.notifier)
          .getMateReply(params: GetMateReplyParams(mateUuid: widget.mateUuid));
    });
  }

  void _onCommentRender() {
    setState(() {});
  }

  Widget _profile() {
    final UserState userState = ref.watch(userViewModelProvider);

    if (userState.data.profileImageUrl != null) {
      return Container(
        width: 24,
        height: 24,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),

        child: CachedNetworkImage(
          imageUrl: userState.data.profileImageUrl!,
          fit: BoxFit.cover,
        ),
      );
    }

    return userState.data.gender == 'MALE'
        ? CustomProfilePhotoSize.boy(size: CustomProfilePhotoSizeEnum.m)
        : CustomProfilePhotoSize.girl(size: CustomProfilePhotoSizeEnum.m);
  }

  Widget _commentItem({required MateReplyDetailModel item}) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CustomProfilePhotoSize.girl(size: CustomProfilePhotoSizeEnum.m),
                const SizedBox(width: 8),
                Text(
                  item.nickname,
                  style: textTheme.labelLarge?.copyWith(
                    color: ScaleColorConfig.neutral10,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Assets.icon.system.reportLine.svg(
                width: 16,
                colorFilter: const ColorFilter.mode(
                  ScaleColorConfig.neutral40,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        Text(
          item.content,
          style: textTheme.bodySmall?.copyWith(
            color: ScaleColorConfig.neutral30,
          ),
        ),
        const SizedBox(height: 6),

        Text(
          item.createdAt.toTime(),
          style: textTheme.bodySmall?.copyWith(
            color: ScaleColorConfig.neutral50,
          ),
        ),
        const SizedBox(height: 6),

        CustomOutlineButton.xSmall(width: 50, label: '답글', onPressed: () {}),
      ],
    );
  }

  @override
  void dispose() {
    _commentController.removeListener(_onCommentRender);
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserState userState = ref.watch(userViewModelProvider);
    final DessertCommentState state = ref.watch(
      dessertCommentViewModelProvider,
    );
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(dessertCommentViewModelProvider, (_, DessertCommentState next) {
      switch (next.status) {
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
    });

    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: ScaleColorConfig.surface80),
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '댓글',
                    style: textTheme.titleSmall?.copyWith(
                      color: ScaleColorConfig.neutral20,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    state.data.count.toString(),
                    style: textTheme.titleSmall?.copyWith(
                      color: ScaleColorConfig.success50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              /// 댓글 등록
              Column(
                children: <Widget>[
                  CustomTextField(
                    controller: _commentController,
                    profile: Row(
                      children: <Widget>[
                        _profile(),
                        const SizedBox(width: 8),
                        Text(
                          userState.data.nickname,
                          style: textTheme.labelLarge?.copyWith(
                            color: ScaleColorConfig.neutral10,
                          ),
                        ),
                      ],
                    ),
                    maxLength: 300,
                  ),
                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomFillButton.xSmall(
                      width: 50,
                      label: '등록',
                      disabled: _commentController.text.isEmpty,
                      onPressed: () {
                        ref
                            .read(dessertCommentViewModelProvider.notifier)
                            .postMateReply(
                              params: PostMateReplyParams(
                                mateUuid: state.data.mateUuid,
                                userUuid: userState.data.userUuid,
                                content: _commentController.text,
                              ),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// 댓글 리스트
        ...List<Widget>.generate(state.data.mateReplies.length, (int index) {
          final MateReplyDetailModel item = state.data.mateReplies[index];

          return Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ScaleColorConfig.surface80),
                  ),
                ),
                child: _commentItem(item: item),
              ),

              ...List<Widget>.generate(state.data.mateReplies.length, (
                int index,
              ) {
                final MateReplyDetailModel item = state.data.mateReplies[index];

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: ScaleColorConfig.surface80),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Assets.icon.arrow.cornerDownRightLine.svg(
                        colorFilter: const ColorFilter.mode(
                          ScaleColorConfig.neutral50,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(child: _commentItem(item: item)),
                    ],
                  ),
                );
              }),

              // ...List<Widget>.generate(item.children.length, (int index) {
              //   final MateReplyDetailModel childItem = item.children[index];

              //   return _commentItem(item: childItem);
              // }),
            ],
          );
        }),
      ],
    );
  }
}
