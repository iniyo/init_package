// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'KEY1')
  static const String key1 = _Env.key1;
  @EnviedField(defaultValue: 'test_')
  static const String test = _Env.test;
}
