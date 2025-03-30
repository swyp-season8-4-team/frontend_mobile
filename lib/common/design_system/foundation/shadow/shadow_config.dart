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
  static Level1 level1 = Level1();
  static Level2 level2 = Level2();
  static Level3 level3 = Level3();
  static Level4 level4 = Level4();
  static Level5 level5 = Level5();
}
