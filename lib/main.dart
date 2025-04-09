import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/foundation/foundation.dart';
import 'package:frontend_mobile/common/gen_asset/fonts.gen.dart';
import 'package:frontend_mobile/presentation/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: Portal(child: MainApp())));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    super.initState();
    _initAppTrackingTransparency();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ref.read(appRouterProvider).routerConfig,
      theme: ThemeData(
        fontFamily: FontFamily.pretendard,
        colorScheme: FoundationConfig.colorScheme,
        textTheme: FoundationConfig.textTheme,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }

  // ATT 팝업창 표시
  Future<void> _initAppTrackingTransparency() async {
    TrackingStatus authorizationStatus =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    int timeoutCount = 0;

    // IOS 17.0.2에서 ATT팝업창이 표시되지 않는 경우가 있어서
    // 딜레이를 두면서 최대 10번까지 표시될 수 있도록 구성
    while (authorizationStatus == TrackingStatus.notDetermined &&
        timeoutCount < 10) {
      authorizationStatus =
          await AppTrackingTransparency.requestTrackingAuthorization();
      await Future<void>.delayed(const Duration(milliseconds: 200));
      timeoutCount++;
    }
  }
}
