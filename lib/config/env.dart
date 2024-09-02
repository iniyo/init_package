// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'KEY1')
  static const String key1 = _Env.key1;
  @EnviedField(varName: 'KEY2')
  static const String key2 = _Env.key2;
  @EnviedField(varName: 'KEY3')
  static const String key3 = _Env.key3;
  @EnviedField(defaultValue: 'test_')
  static const String test = _Env.test;
}
