import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    _initAppTrackingTransparency();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: LocalLoginView()));
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
