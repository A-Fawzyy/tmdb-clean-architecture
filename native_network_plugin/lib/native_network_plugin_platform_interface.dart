import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_network_plugin_method_channel.dart';

abstract class NativeNetworkPluginPlatform extends PlatformInterface {
  /// Constructs a NativeNetworkPluginPlatform.
  NativeNetworkPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeNetworkPluginPlatform _instance = MethodChannelNativeNetworkPlugin();

  /// The default instance of [NativeNetworkPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeNetworkPlugin].
  static NativeNetworkPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeNetworkPluginPlatform] when
  /// they register themselves.
  static set instance(NativeNetworkPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Handles the method call and parses it's arguments.
  Future<void> methodCallHandler(MethodCall call);

  /// Performs a getRequest.
  Future<String?> getRequest(String path, {Map<String, dynamic>? queryParameters});
}
