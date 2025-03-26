import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class EtcTag extends StatelessWidget {
  const EtcTag({
    required this.label,
    required this.onTap,
    required this.icon,
    super.key,
  });
  final String label;
  final VoidCallback onTap;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
