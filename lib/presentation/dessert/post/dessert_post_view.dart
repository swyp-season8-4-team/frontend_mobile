import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/presentation/dessert/post/header/info/dessert_post_header_info.dart';
import 'package:frontend_mobile/presentation/dessert/post/header/location/dessert_post_header_location.dart';

class DessertPost extends StatelessWidget {
  const DessertPost({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TopBarIcon icon = TopBarIcon();

    return Scaffold(
      appBar: CustomSubTopBar(
        title: '',
        actions: TopBarIcon.toList(<Widget>[icon.bookMark(onTap: () {})]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16),
              child: DessertPostHeaderInfo(),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
              child: Text('''안녕하세요, 디저트 사랑하는 여러분! 🍰💕

망원동에서 맛있는 베이커리 카페를 탐험할 사람을 모집합니다!
            
🥐 일정: 이번 주말
            
📍 장소: 망원동의 숨겨진 베이커리 카페
            
🎯 목표: 맛있는 빵과 커피를 즐기고, 인생의 소소한 행복을 만끽하기!
            
참고로, 단순히 먹는 것만이 목표는 아닙니다. 서로의 디저트 취향을 공유하고, 재미있는 이야기들도 나누면서 즐거운 시간을 보내고 싶어요! 😋😄
            
참여하고 싶은 분은 댓글로 "저도 가요!"라고 외쳐주세요! 귀여운 디저트 친구가 되어줄 사람, 기다리고 있을게요! 🤗'''),
            ),
          ],
        ),
      ),
    );
  }
}
