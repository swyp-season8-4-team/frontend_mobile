import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/text_field.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_detail_params.dart';
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
  final bool _accepted = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(dessertPostViewModelProvider.notifier)
          .getMateDetail(
            params: GetMateDetailParams(mateUuid: widget.mateUuid),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TopBarIcon icon = TopBarIcon();

    return Scaffold(
      appBar: CustomSubTopBar(
        title: '',
        actions: TopBarIcon.toList(<Widget>[icon.bookMark(onTap: () {})]),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                            color: ScaleColorConfig.neutral50,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
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
                          Text(
                            '2025.04.01',
                            style: textTheme.labelLarge?.copyWith(
                              color: ScaleColorConfig.neutral50,
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (_accepted)
                      Column(
                        children: <Widget>[
                          Container(
                            height: 16,
                            color: const Color.fromRGBO(242, 241, 237, 1),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: <Widget>[
                                const Row(
                                  children: <Widget>[Text('댓글'), Text('3')],
                                ),
                                const SizedBox(height: 30),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        CustomProfilePhotoSize.girl(
                                          size: CustomProfilePhotoSizeEnum.m,
                                        ),
                                        const Text('베베'),
                                      ],
                                    ),
                                    const Text('0/300'),
                                  ],
                                ),
                                const SizedBox(height: 8),

                                const CustomTextField(),
                                const SizedBox(height: 8),

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CustomFillButton.xSmall(
                                    width: 50,
                                    label: '등록',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),

            if (!_accepted)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: ScaleColorConfig.neutral50),
                  ),
                ),
                child: CustomFillButton.large(label: '참여요청', onPressed: () {}),
              ),
          ],
        ),
      ),
    );
  }
}
