import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/component/tag/label_tag.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/text_field.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_params.dart';
import 'package:frontend_mobile/presentation/dessert/comment/dessert_comment_view_model.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:go_router/go_router.dart';

class DessertComment extends ConsumerStatefulWidget {
  const DessertComment({required this.mateUuid, super.key});

  final String mateUuid;

  @override
  ConsumerState<DessertComment> createState() => _DessertCommentState();
}

class _DessertCommentState extends ConsumerState<DessertComment> {
  int commentMateReplyId = -1;

  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _commentController.addListener(_onCommentRender);
    _replyController.addListener(_onReplyRender);
  }

  void _onCommentRender() {
    setState(() {});
  }

  void _onReplyRender() {
    setState(() {});
  }

  Widget _loggedInProfile() {
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

  Widget _commentProfile({required MateReplyDetailModel item}) {
    if (item.profileImage.isNotEmpty) {
      return Container(
        width: 24,
        height: 24,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),

        child: CachedNetworkImage(
          imageUrl: item.profileImage,
          fit: BoxFit.cover,
        ),
      );
    }

    return item.gender == 'MALE'
        ? CustomProfilePhotoSize.boy(size: CustomProfilePhotoSizeEnum.m)
        : CustomProfilePhotoSize.girl(size: CustomProfilePhotoSizeEnum.m);
  }

  Widget _commentItem({
    required MateReplyDetailModel item,
    bool replyButton = true,
  }) {
    final UserState userState = ref.watch(userViewModelProvider);
    final DessertPostState postState = ref.watch(dessertPostViewModelProvider);
    final DessertCommentState state = ref.watch(
      dessertCommentViewModelProvider,
    );
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                _commentProfile(item: item),
                const SizedBox(width: 8),
                Text(
                  item.nickname,
                  style: textTheme.labelLarge?.copyWith(
                    color: ScaleColorConfig.neutral10,
                  ),
                ),
                const SizedBox(width: 6),

                if (item.userUuid == postState.data.userUuid)
                  const CustomLabelTag(
                    label: '모임장',
                    backgroundColor: ScaleColorConfig.success80,
                    color: ScaleColorConfig.success10,
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

        if (replyButton)
          if (commentMateReplyId != item.mateReplyId)
            CustomOutlineButton.xSmall(
              width: 50,
              label: '답글',
              onPressed: () {
                setState(() {
                  commentMateReplyId = item.mateReplyId;
                });
              },
            )
          else
            Column(
              children: <Widget>[
                CustomTextField(controller: _replyController),
                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CustomOutlineButton.xSmall(
                      width: 50,
                      label: '취소',
                      onPressed: () {
                        setState(() {
                          commentMateReplyId = -1;
                        });
                      },
                    ),
                    const SizedBox(width: 3),
                    CustomFillButton.xSmall(
                      width: 50,
                      label: '등록',
                      disabled: _replyController.text.isEmpty,
                      onPressed: () {
                        ref
                            .read(dessertCommentViewModelProvider.notifier)
                            .postMateReply(
                              params: PostMateReplyParams(
                                parentMateReplyId: commentMateReplyId,
                                mateUuid: state.data.mateUuid,
                                userUuid: userState.data.userUuid,
                                content: _replyController.text,
                              ),
                            );

                        setState(() {
                          commentMateReplyId = -1;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
      ],
    );
  }

  @override
  void dispose() {
    _commentController.removeListener(_onCommentRender);
    _commentController.dispose();
    _replyController.removeListener(_onReplyRender);
    _replyController.dispose();
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
        case Status.success:
          _commentController.clear();
          _replyController.clear();
          break;

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
                      color:
                          state.data.count == 0
                              ? ScaleColorConfig.neutral40
                              : ScaleColorConfig.success50,
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
                        _loggedInProfile(),
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

        if (state.data.mateReplies.isEmpty)
          SizedBox(
            height: 116,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                '아직 댓글이 없어요',
                style: textTheme.labelLarge?.copyWith(
                  color: ScaleColorConfig.neutral50,
                ),
              ),
            ),
          )
        else
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

                ...List<Widget>.generate(item.children.length, (int index) {
                  final MateReplyDetailModel childItem = item.children[index];

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
                        Expanded(
                          child: _commentItem(
                            item: childItem,
                            replyButton: false,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            );
          }),
      ],
    );
  }
}
