import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_network_plugin/native_network_plugin_method_channel.dart';
import 'package:native_network_plugin/utils/index.dart';

void main() {
  MethodChannelNativeNetworkPlugin platform = MethodChannelNativeNetworkPlugin();
  const MethodChannel channel = MethodChannel(MethodChannelNames.channelName);

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getRequest', () async {
    expect(await platform.getRequest('https://sampletestapi.free.beeceptor.com'), 'Hey ya! Great to see you here. Btw, nothing is configured for this request path. Create a rule and start building a mock API.');
  });
}
