import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_detail_params.dart';
import 'package:frontend_mobile/domain/param/mate_reply/get_mate_reply_params.dart';
import 'package:frontend_mobile/presentation/dessert/comment/dessert_comment_view.dart';
import 'package:frontend_mobile/presentation/dessert/comment/dessert_comment_view_model.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';
import 'package:frontend_mobile/presentation/dessert/post/header/info/dessert_post_header_info.dart';
import 'package:frontend_mobile/presentation/dessert/post/header/location/dessert_post_header_location.dart';

class DessertPost extends ConsumerStatefulWidget {
  const DessertPost({required this.mateUuid, super.key});

  final String mateUuid;

  @override
  ConsumerState<DessertPost> createState() => _DessertPostState();
}

class _DessertPostState extends ConsumerState<DessertPost> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(dessertPostViewModelProvider.notifier)
          .getMateDetail(
            params: GetMateDetailParams(mateUuid: widget.mateUuid),
          );

      ref
          .read(dessertCommentViewModelProvider.notifier)
          .getMateReply(
            params: GetMateReplyParams(mateUuid: widget.mateUuid, to: 1000),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomSubTopBar(
        title: '',
        actions: TopBarIcon.toList(<Widget>[]),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: DessertPostHeaderInfo(),
                    ),

                    if (state.data.place?.placeName != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: ScaleColorConfig.neutral70),
                            bottom: BorderSide(
                              color: ScaleColorConfig.neutral70,
                            ),
                          ),
                        ),
                        child: const DessertPostHeaderLocation(),
                      ),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(state.data.content),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: ScaleColorConfig.surface80,
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          if (state.data.applyStatus == 'NONE')
                            Row(
                              children: <Widget>[
                                Assets.icon.contact.message1Line.svg(
                                  width: 16,
                                  colorFilter: const ColorFilter.mode(
                                    ScaleColorConfig.neutral50,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '3',
                                  style: textTheme.labelLarge?.copyWith(
                                    color: ScaleColorConfig.neutral50,
                                  ),
                                ),
                              ],
                            ),
                          if (state.data.createdAt.isNotEmpty) ...<Widget>[
                            const Spacer(),
                            Text(
                              state.data.createdAt.toDate(),
                              style: textTheme.labelLarge?.copyWith(
                                color: ScaleColorConfig.neutral50,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    Container(
                      height: 16,
                      color: const Color.fromRGBO(242, 241, 237, 1),
                    ),
                    DessertComment(mateUuid: widget.mateUuid),
                  ],
                ),
              ),
            ),

            // if (!_accepted)
            //   Container(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 16,
            //       vertical: 20,
            //     ),
            //     decoration: const BoxDecoration(
            //       border: Border(
            //         top: BorderSide(color: ScaleColorConfig.neutral50),
            //       ),
            //     ),
            //     child: CustomFillButton.large(label: '참여요청', onPressed: () {}),
            //   ),
          ],
        ),
      ),
    );
  }
}
