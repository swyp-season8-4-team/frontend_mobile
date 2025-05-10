import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_button.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:go_router/go_router.dart';

class SuccessReportStoreReviewView extends ConsumerWidget {
  const SuccessReportStoreReviewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomSubTopBar(
        title: '신고',
        actions: <Widget>[],
        primary: false,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // TODO: 타이포그래피 적용 필요
              const Text(
                '소중한 신고 감사합니다',
                style: TextStyle(
                  color: Color(0xFF191919),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 1.27,
                  letterSpacing: -1.10,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '디저비 커뮤니티의 건강한 소통을 위해\n검토 후 적절히 조치하겠습니다',
                style: textTheme.bodyMedium?.copyWith(
                  color: ScaleColorConfig.neutral30,
                ),
              ),
              const SizedBox(height: 39),
              CustomPillButton(
                label: '가게 상세 이동',
                width: 144,
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
