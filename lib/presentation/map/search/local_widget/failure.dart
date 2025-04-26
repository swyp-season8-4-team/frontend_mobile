part of '../search_store_view.dart';

class _Failure extends ConsumerWidget {
  const _Failure({required this.onRetryTap});
  final VoidCallback onRetryTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultError(onRetry: onRetryTap);
  }
}
