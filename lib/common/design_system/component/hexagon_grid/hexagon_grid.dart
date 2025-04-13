import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:hexagon/hexagon.dart';

/// Pentagon
/// 개발 편의상 Hexagon Grid로 지칭
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000221-73140&m=dev

// FIXME : hexagons의 length가 3이나 4일때 height가 크게 표시되고 있음. 3,4 길이를 갖는 HexagonGrid 사용시 주의 필요.
class CustomHexagon {
  const CustomHexagon({this.text, this.imageUrl})
    : assert(
        text != null || imageUrl != null,
        'both text and imageUrl cannot be null.',
      );
  final String? text;
  final String? imageUrl;
}

typedef _HexagonSize = ({double width, double height});

typedef _HexagonPosition = ({int row, int column});

typedef _HexagonRowsAndColumns = ({int rows, int columns});

class CustomHexagonGrid extends StatefulWidget {
  const CustomHexagonGrid({required this.hexagons, super.key});

  // 헥사곤 목록
  final List<CustomHexagon> hexagons;

  @override
  State<CustomHexagonGrid> createState() => _CustomHexagonGridState();
}

class _CustomHexagonGridState extends State<CustomHexagonGrid> {
  double _gridHeight = 999;
  final GlobalKey _gridKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getHeight();
    });
  }

  void _getHeight() {
    final BuildContext? context = _gridKey.currentContext;
    if (context == null) return;

    final RenderBox box = context.findRenderObject() as RenderBox;
    setState(() {
      _gridHeight = box.size.height;
    });
  }

  double get _cornerRadius {
    return switch (widget.hexagons.length) {
      1 => 20,
      2 => 15,
      3 => 15,
      4 => 11,
      5 || 6 || 7 || 8 || 9 || 10 || 11 => 9.85,
      _ => throw Exception(),
    };
  }

  _HexagonRowsAndColumns get _rowsAndColumns {
    return switch (widget.hexagons.length) {
      1 => (rows: 1, columns: 1),
      2 => (rows: 1, columns: 2),
      3 => (rows: 2, columns: 2),
      4 || 5 || 6 => (rows: 2, columns: 3),
      7 || 8 || 9 => (rows: 3, columns: 3),
      10 || 11 => (rows: 4, columns: 3),
      _ => throw Exception(),
    };
  }

  _HexagonSize get _size {
    return switch (widget.hexagons.length) {
      1 => (width: 200, height: 200),
      2 => (width: 270, height: 230),
      3 => (width: 270, height: 267),
      4 => (width: 294, height: 204),
      5 => (width: 270, height: 187),
      6 => (width: 270, height: 250),
      7 || 8 => (width: 270, height: 280),
      9 => (width: 270, height: 350),
      10 || 11 => (width: 270, height: 375),
      _ => throw Exception(),
    };
  }

  List<_HexagonPosition> get _positions {
    return switch (widget.hexagons.length) {
      1 => <_HexagonPosition>[(row: 0, column: 0)],
      2 => <_HexagonPosition>[(row: 0, column: 0), (row: 0, column: 1)],
      3 => <_HexagonPosition>[
        (row: 0, column: 0),
        (row: 0, column: 1),
        (row: 1, column: 0),
      ],
      4 => <_HexagonPosition>[
        (row: 0, column: 1),
        (row: 1, column: 0),
        (row: 1, column: 1),
        (row: 1, column: 2),
      ],
      5 => <_HexagonPosition>[
        (row: 0, column: 0),
        (row: 0, column: 1),
        (row: 0, column: 2),
        (row: 1, column: 0),
        (row: 1, column: 2),
      ],
      6 => <_HexagonPosition>[
        (row: 0, column: 0),
        (row: 0, column: 1),
        (row: 0, column: 2),
        (row: 1, column: 0),
        (row: 1, column: 1),
        (row: 1, column: 2),
      ],
      7 => <_HexagonPosition>[
        (row: 0, column: 0),
        (row: 0, column: 1),
        (row: 0, column: 2),
        (row: 1, column: 0),
        (row: 1, column: 1),
        (row: 1, column: 2),
        (row: 2, column: 0),
      ],
      8 => <_HexagonPosition>[
        (row: 0, column: 0),
        (row: 0, column: 1),
        (row: 0, column: 2),
        (row: 1, column: 0),
        (row: 1, column: 1),
        (row: 1, column: 2),
        (row: 2, column: 0),
        (row: 2, column: 2),
      ],
      9 => <_HexagonPosition>[
        (row: 0, column: 0),
        (row: 0, column: 1),
        (row: 0, column: 2),
        (row: 1, column: 0),
        (row: 1, column: 1),
        (row: 1, column: 2),
        (row: 2, column: 0),
        (row: 2, column: 1),
        (row: 2, column: 2),
      ],
      10 => <_HexagonPosition>[
        (row: 0, column: 0),
        (row: 0, column: 1),
        (row: 0, column: 2),
        (row: 1, column: 0),
        (row: 1, column: 1),
        (row: 1, column: 2),
        (row: 2, column: 0),
        (row: 2, column: 1),
        (row: 2, column: 2),
        (row: 3, column: 0),
      ],
      11 => <_HexagonPosition>[
        (row: 0, column: 0),
        (row: 0, column: 1),
        (row: 0, column: 2),
        (row: 1, column: 0),
        (row: 1, column: 1),
        (row: 1, column: 2),
        (row: 2, column: 0),
        (row: 2, column: 1),
        (row: 2, column: 2),
        (row: 3, column: 0),
        (row: 3, column: 2),
      ],
      _ => throw Exception(),
    };
  }

  TextStyle? getTextStyle(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return switch (widget.hexagons.length) {
      1 => textTheme.displaySmall?.copyWith(color: ScaleColorConfig.primary40),
      2 ||
      3 => textTheme.headlineSmall?.copyWith(color: ScaleColorConfig.primary40),
      4 => textTheme.titleSmall?.copyWith(color: ScaleColorConfig.primary40),
      5 ||
      6 ||
      7 ||
      8 ||
      9 ||
      10 ||
      11 => textTheme.titleSmall?.copyWith(color: ScaleColorConfig.primary40),
      _ => throw Exception(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final double heightFactor = _size.height / _gridHeight;

    final _HexagonRowsAndColumns rowsAndColumns = _rowsAndColumns;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: _size.width,
          child: ClipRect(
            child: Align(
              alignment:
                  widget.hexagons.length == 4
                      ? Alignment.bottomCenter
                      : Alignment.topCenter,
              heightFactor: min(heightFactor, 1),
              child: SizedBox(
                key: _gridKey,
                child: HexagonOffsetGrid.oddFlat(
                  columns: rowsAndColumns.columns,
                  rows: rowsAndColumns.rows,
                  buildTile: (int col, int row) {
                    final List<_HexagonPosition> positions = _positions;

                    final int index = positions.indexOf((
                      row: row,
                      column: col,
                    ));

                    if (index == -1) {
                      return HexagonWidgetBuilder.transparent();
                    }

                    final CustomHexagon hexagon = widget.hexagons[index];

                    return HexagonWidgetBuilder(
                      cornerRadius: _cornerRadius,
                      padding: 5,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.5),
                              child: SizedBox(
                                child: Assets.icon.etc.hexagon.svg(),
                              ),
                            ),
                          ),
                          Align(
                            child:
                                hexagon.text != null
                                    ? Padding(
                                      padding: const EdgeInsets.all(5.5),
                                      child: Text(
                                        hexagon.text!,
                                        style: getTextStyle(context),
                                      ),
                                    )
                                    : CachedNetworkImage(
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      imageUrl: hexagon.imageUrl!,
                                    ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
