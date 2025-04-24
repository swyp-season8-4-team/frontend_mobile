import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPolicyView extends StatelessWidget {
  const MyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomSubTopBar(
        title: '약관 및 정책',
        primary: false,
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _MenuItem(
                  label: '서비스 이용약관',
                  onTap: () {
                    _launchUrl(
                      urlString:
                          'https://deadpan-swift-62c.notion.site/1b5c3a9f020181baadfff3d50d9ef94f',
                    );
                  },
                ),
                const SizedBox(height: 8),
                _MenuItem(
                  label: '개인정보 취급방침',
                  onTap: () {
                    _launchUrl(
                      urlString:
                          'https://deadpan-swift-62c.notion.site/1b5c3a9f0201810687b6f5331db62ea3',
                    );
                  },
                ),
                const SizedBox(height: 8),
                _MenuItem(
                  label: '위치기반 서비스 이용약관',
                  onTap: () {
                    _launchUrl(
                      urlString:
                          'https://deadpan-swift-62c.notion.site/1b5c3a9f0201815f874cf82efb5317ad',
                    );
                  },
                ),
                const SizedBox(height: 8),
                _MenuItem(
                  label: '마케팅 동의 약관',
                  onTap: () {
                    _launchUrl(
                      urlString:
                          'https://deadpan-swift-62c.notion.site/DesserBee-1b5c3a9f0201819882f7c746ff83c5e2',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl({required String urlString}) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}

// 메뉴 아이템
class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: ScaleColorConfig.neutral90,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label,
                style: textTheme.titleSmall?.copyWith(
                  color: ScaleColorConfig.neutral30,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Assets.icon.arrow.rightLine.svg(
              colorFilter: const ColorFilter.mode(
                ScaleColorConfig.neutral40,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
