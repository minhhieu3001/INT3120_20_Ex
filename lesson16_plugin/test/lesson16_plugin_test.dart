import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lesson16_plugin/lesson16_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('lesson16_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Lesson16Plugin.platformVersion, '42');
  });
}
