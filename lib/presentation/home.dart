import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view_model.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LocalLoginState loginState = ref.watch(localLoginViewModelProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(loginState.data.nickname),
            Text(loginState.data.email),
            Text(loginState.data.deviceId),
          ],
        ),
      ),
    );
  }
}
