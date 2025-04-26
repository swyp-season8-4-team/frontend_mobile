import 'package:flutter/material.dart';
import 'package:frontend_mobile/presentation/dessert/post/header/info/dessert_post_header_info_first.dart';
import 'package:frontend_mobile/presentation/dessert/post/header/info/dessert_post_header_info_second.dart';
import 'package:frontend_mobile/presentation/dessert/post/header/info/dessert_post_header_info_third.dart';

class DessertPostHeaderInfo extends StatelessWidget {
  const DessertPostHeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DessertPostHeaderInfoFirst(),
        SizedBox(height: 10),

        DessertPostHeaderInfoSecond(),
        SizedBox(height: 16),

        DessertPostHeaderInfoThird(),
      ],
    );
  }
}
