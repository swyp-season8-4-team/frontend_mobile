import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomDessertMateButton extends StatefulWidget {
  const CustomDessertMateButton({required this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  State<CustomDessertMateButton> createState() =>
      _CustomDessertMateButtonState();
}

class _CustomDessertMateButtonState extends State<CustomDessertMateButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    // TODO: Shadow 정의되면 적용해야 함
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (TapDownDetails details) {
        setState(() {
          _pressed = true;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          _pressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _pressed = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color:
              !_pressed
                  ? ScaleColorConfig.primary80
                  : ScaleColorConfig.primary70,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 28,
              height: 28,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5E2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.network(
                'https://media.istockphoto.com/id/1272346946/ko/%EB%B2%A1%ED%84%B0/%ED%9D%B0%EC%83%89-%EB%B0%B0%EA%B2%BD-%ED%8F%89%EB%A9%B4-%EB%94%94%EC%9E%90%EC%9D%B8-%EA%B3%BC%EC%9D%BC-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8%EC%97%90-%EA%B3%A0%EB%A6%BD-%EB%90%9C-%EB%85%B9%EC%83%89-%EC%9E%8E%EA%B3%BC-%EB%B9%A8%EA%B0%84-%EC%82%AC%EA%B3%BC.jpg?s=612x612&w=0&k=20&c=LNBh3TjJuN0phNd4w116zcV4P_vC_1M1bqTpSZovCtk=',
              ),
            ),
            const SizedBox(width: 2),
            const SizedBox(
              child: Text(
                '디저트 메이트',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xFF504209),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
