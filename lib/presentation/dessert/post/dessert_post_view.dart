import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/text_field.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/presentation/dessert/post/header/info/dessert_post_header_info.dart';
import 'package:frontend_mobile/presentation/dessert/post/header/location/dessert_post_header_location.dart';

class DessertPost extends StatefulWidget {
  const DessertPost({super.key});

  @override
  State<DessertPost> createState() => _DessertPostState();
}

class _DessertPostState extends State<DessertPost> {
  final bool _accepted = true;

  @override
  Widget build(BuildContext context) {
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

                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: ScaleColorConfig.neutral70),
                          bottom: BorderSide(color: ScaleColorConfig.neutral70),
                        ),
                      ),
                      child: const DessertPostHeaderLocation(),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        '''안녕하세요, 디저트 사랑하는 여러분! 🍰💕
          
          망원동에서 맛있는 베이커리 카페를 탐험할 사람을 모집합니다!
            
          🥐 일정: 이번 주말
            
          📍 장소: 망원동의 숨겨진 베이커리 카페
            
          🎯 목표: 맛있는 빵과 커피를 즐기고, 인생의 소소한 행복을 만끽하기!
            
          참고로, 단순히 먹는 것만이 목표는 아닙니다. 서로의 디저트 취향을 공유하고, 재미있는 이야기들도 나누면서 즐거운 시간을 보내고 싶어요! 😋😄
            
          참여하고 싶은 분은 댓글로 "저도 가요!"라고 외쳐주세요! 귀여운 디저트 친구가 되어줄 사람, 기다리고 있을게요! 🤗''',
                      ),
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
