import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_network_plugin/native_network_plugin.dart';
import 'package:native_network_plugin/native_network_plugin_platform_interface.dart';
import 'package:native_network_plugin/native_network_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeNetworkPluginPlatform
    with MockPlatformInterfaceMixin
    implements NativeNetworkPluginPlatform {



  @override
  Future<void> methodCallHandler(MethodCall call) {
    // TODO: implement methodCallHandler
    throw UnimplementedError();
  }

  @override
  Future<String?> getRequest(String path, {Map<String, dynamic>? queryParameters}) {
    return Future.value('Hey ya! Great to see you here. Btw, nothing is configured for this request path. Create a rule and start building a mock API.');
  }
}

void main() {
  final NativeNetworkPluginPlatform initialPlatform = NativeNetworkPluginPlatform.instance;

  test('$MethodChannelNativeNetworkPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeNetworkPlugin>());
  });

  test('getRequest', () async {
    NativeNetworkPlugin nativeNetworkPlugin = NativeNetworkPlugin();
    MockNativeNetworkPluginPlatform fakePlatform = MockNativeNetworkPluginPlatform();
    NativeNetworkPluginPlatform.instance = fakePlatform;

    expect(await nativeNetworkPlugin.get('https://sampletestapi.free.beeceptor.com'), 'Hey ya! Great to see you here. Btw, nothing is configured for this request path. Create a rule and start building a mock API.');
  });
}
