import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/presentation/dessert/widget/list/dessert_list_body.dart';
import 'package:frontend_mobile/presentation/dessert/widget/list/dessert_list_footer.dart';
import 'package:frontend_mobile/presentation/dessert/widget/list/dessert_list_header.dart';
import 'package:frontend_mobile/presentation/dessert/widget/list/dessert_list_image.dart';

class DessertListCard extends StatelessWidget {
  const DessertListCard({
    required this.bookmarkSelected,
    required this.onBookMarkTap,
    required this.onCardTap,
    super.key,
  });

  final bool bookmarkSelected;
  final VoidCallback? onBookMarkTap;
  final VoidCallback? onCardTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onCardTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ScaleColorConfig.primary100,
        ),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const DessertListImage(
                  imageUrl:
                      'https://img.freepik.com/free-vector/beautiful-watercolor-background_23-2148486848.jpg?semt=ais_hybrid&w=740',
                ),

                GestureDetector(
                  onTap: onBookMarkTap,
                  child: Container(
                    child:
                        !bookmarkSelected
                            ? Assets.icon.etc.bookmarkUnselected.svg()
                            : Assets.icon.etc.bookmarkSelected.svg(),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DessertListHeader(),
                  SizedBox(height: 4),

                  DessertListBody(),
                  SizedBox(height: 4),

                  DessertListFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
