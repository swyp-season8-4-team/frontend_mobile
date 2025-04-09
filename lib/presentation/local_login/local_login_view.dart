import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/enum.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class LocalLoginView extends ConsumerStatefulWidget {
  const LocalLoginView({super.key});

  @override
  ConsumerState<LocalLoginView> createState() => _LocalLoginViewState();
}

class _LocalLoginViewState extends ConsumerState<LocalLoginView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(localLoginViewModelProvider.notifier)
          .postDevLocalLogin(
            params: LocalLoginParams(
              email: 'test@example.com',
              password: '123456',
              keepLoggedIn: true,
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final LocalLoginState localLoginState = ref.watch(
      localLoginViewModelProvider,
    );

    if (localLoginState.status == Status.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoutes.findPasswordStep1.name);
              },
              child: const Text('비밀번호 찾기'),
            ),
            Text('accessToken: ${localLoginState.data.accessToken}'),
            Text('refreshToken: ${localLoginState.data.refreshToken}'),
            Text('email: ${localLoginState.data.email}'),
            Text('nickname: ${localLoginState.data.nickname}'),
          ],
        ),
      ),
    );
  }
}
