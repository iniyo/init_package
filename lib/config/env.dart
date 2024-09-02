// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'KEY1')
  static const String key1 = _Env.key1;
  @EnviedField()
  static const String key2 = _Env.KEY2;
  @EnviedField(defaultValue: 'test_')
  static const String key3 = _Env.key3;
}