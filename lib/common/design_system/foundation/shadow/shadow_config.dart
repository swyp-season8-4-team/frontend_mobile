import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_type.dart';

abstract interface class Level {
  late ShadowType first;
  late ShadowType second;
}

/// Shadow01
class Level1 implements Level {
  @override
  ShadowType first = ShadowType(
    dx: 0,
    dy: 1,
    blurRadius: 3,
    spreadRadius: 1,
    color: const Color.fromRGBO(57, 57, 57, 0.13),
  );

  @override
  ShadowType second = ShadowType(
    dx: 0,
    dy: 1,
    blurRadius: 2,
    spreadRadius: 0,
    color: const Color.fromRGBO(57, 57, 57, 0.25),
  );
}

/// Shadow02
class Level2 implements Level {
  @override
  ShadowType first = ShadowType(
    dx: 0,
    dy: 2,
    blurRadius: 6,
    spreadRadius: 2,
    color: const Color.fromRGBO(40, 32, 20, 0.15),
  );

  @override
  ShadowType second = ShadowType(
    dx: 0,
    dy: 1,
    blurRadius: 2,
    spreadRadius: 0,
    color: const Color.fromRGBO(40, 32, 20, 0.3),
  );
}

/// Shadow03
class Level3 implements Level {
  @override
  ShadowType first = ShadowType(
    dx: 0,
    dy: 2,
    blurRadius: 8,
    spreadRadius: 2,
    color: const Color.fromRGBO(40, 32, 20, 0.15),
  );

  @override
  ShadowType second = ShadowType(
    dx: 0,
    dy: 2,
    blurRadius: 3,
    spreadRadius: 0,
    color: const Color.fromRGBO(40, 32, 20, 0.12),
  );
}

/// Shadow04
class Level4 implements Level {
  @override
  ShadowType first = ShadowType(
    dx: 0,
    dy: 2,
    blurRadius: 3,
    spreadRadius: 0,
    color: const Color.fromRGBO(40, 32, 20, 0.3),
  );

  @override
  ShadowType second = ShadowType(
    dx: 0,
    dy: 6,
    blurRadius: 10,
    spreadRadius: 4,
    color: const Color.fromRGBO(40, 32, 20, 0.15),
  );
}

/// Shadow05
class Level5 implements Level {
  @override
  ShadowType first = ShadowType(
    dx: 0,
    dy: 3,
    blurRadius: 5,
    spreadRadius: 1,
    color: const Color.fromRGBO(40, 32, 20, 0.3),
  );

  @override
  ShadowType second = ShadowType(
    dx: 0,
    dy: 6,
    blurRadius: 10,
    spreadRadius: 4,
    color: const Color.fromRGBO(40, 32, 20, 0.15),
  );
}

class ShadowConfig {
  factory ShadowConfig() {
    return _instance;
  }

  ShadowConfig._();

  static ShadowConfig get _instance => ShadowConfig._();

  /// level1이 적용된 BoxShadow
  List<BoxShadow> get level1 => <BoxShadow>[
    BoxShadow(
      color: Level1().first.color,
      offset: Offset(Level1().first.dx, Level1().first.dy),
      spreadRadius: Level1().first.spreadRadius,
      blurRadius: Level1().first.blurRadius,
    ),
    BoxShadow(
      color: Level1().second.color,
      offset: Offset(Level1().second.dx, Level1().second.dy),
      spreadRadius: Level1().second.spreadRadius,
      blurRadius: Level1().second.blurRadius,
    ),
  ];

  /// level2가 적용된 BoxShadow
  List<BoxShadow> get level2 => <BoxShadow>[
    BoxShadow(
      color: Level2().first.color,
      offset: Offset(Level2().first.dx, Level2().first.dy),
      spreadRadius: Level2().first.spreadRadius,
      blurRadius: Level2().first.blurRadius,
    ),
    BoxShadow(
      color: Level2().second.color,
      offset: Offset(Level2().second.dx, Level2().second.dy),
      spreadRadius: Level2().second.spreadRadius,
      blurRadius: Level2().second.blurRadius,
    ),
  ];

  /// level3이 적용된 BoxShadow
  List<BoxShadow> get level3 => <BoxShadow>[
    BoxShadow(
      color: Level3().first.color,
      offset: Offset(Level3().first.dx, Level3().first.dy),
      spreadRadius: Level3().first.spreadRadius,
      blurRadius: Level3().first.blurRadius,
    ),
    BoxShadow(
      color: Level3().second.color,
      offset: Offset(Level3().second.dx, Level3().second.dy),
      spreadRadius: Level3().second.spreadRadius,
      blurRadius: Level3().second.blurRadius,
    ),
  ];

  /// level4가 적용된 BoxShadow
  List<BoxShadow> get level4 => <BoxShadow>[
    BoxShadow(
      color: Level4().first.color,
      offset: Offset(Level4().first.dx, Level4().first.dy),
      spreadRadius: Level4().first.spreadRadius,
      blurRadius: Level4().first.blurRadius,
    ),
    BoxShadow(
      color: Level4().second.color,
      offset: Offset(Level4().second.dx, Level4().second.dy),
      spreadRadius: Level4().second.spreadRadius,
      blurRadius: Level4().second.blurRadius,
    ),
  ];

  /// level5가 적용된 BoxShadow
  List<BoxShadow> get level5 => <BoxShadow>[
    BoxShadow(
      color: Level5().first.color,
      offset: Offset(Level5().first.dx, Level5().first.dy),
      spreadRadius: Level5().first.spreadRadius,
      blurRadius: Level5().first.blurRadius,
    ),
    BoxShadow(
      color: Level5().second.color,
      offset: Offset(Level5().second.dx, Level5().second.dy),
      spreadRadius: Level5().second.spreadRadius,
      blurRadius: Level5().second.blurRadius,
    ),
  ];
}
