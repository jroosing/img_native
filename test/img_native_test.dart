import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:img_native/img_native.dart';

void main() {
  const MethodChannel channel = MethodChannel('img_native');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

//  test('getPlatformVersion', () async {
//    expect(await ImgNative.grayscale(), '42');
//  });
}
