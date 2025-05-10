import 'package:flutter/material.dart';
import 'package:frontend_mobile/presentation/dessert/post/widget/header/info/dessert_post_header_info_first.dart';
import 'package:frontend_mobile/presentation/dessert/post/widget/header/info/dessert_post_header_info_second.dart';
import 'package:frontend_mobile/presentation/dessert/post/widget/header/info/dessert_post_header_info_third.dart';

class DessertPostHeaderInfo extends StatelessWidget {
  const DessertPostHeaderInfo({
    required this.isOptionActive,
    required this.optionHandler,
    super.key,
  });

  final bool isOptionActive;
  final VoidCallback optionHandler;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const DessertPostHeaderInfoFirst(),
        const SizedBox(height: 10),

        const DessertPostHeaderInfoSecond(),
        const SizedBox(height: 16),

        DessertPostHeaderInfoThird(
          isOptionActive: isOptionActive,
          optionHandler: optionHandler,
        ),
      ],
    );
  }
}
