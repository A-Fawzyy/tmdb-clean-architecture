import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:native_network_plugin/utils/index.dart';

import 'native_network_plugin_platform_interface.dart';

/// An implementation of [NativeNetworkPluginPlatform] that uses method channels.
class MethodChannelNativeNetworkPlugin extends NativeNetworkPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(MethodChannelNames.channelName);

  static void registerWith() {
    NativeNetworkPluginPlatform.instance = MethodChannelNativeNetworkPlugin();
  }
  MethodChannelNativeNetworkPlugin() : super() {
    methodChannel.setMethodCallHandler(methodCallHandler);
  }

  @override
  Future<String?> getRequest(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final String? response = await methodChannel
        .invokeMethod<String?>(MethodChannelNames.get, <String, dynamic>{
      MethodChannelParameterNames.path: path,
      MethodChannelParameterNames.queryParameters: queryParameters,
    });
    return response;
  }

  @override
  Future<void> methodCallHandler(MethodCall call) {
    log('methodCallHandler: ${call.method}');
    switch (call.method) {
      case MethodChannelNames.get:
        {
          final String path = call.arguments[MethodChannelParameterNames.path];
          final queryParameters =
          call.arguments[MethodChannelParameterNames.queryParameters]
          as Map<String, dynamic>?;
          return getRequest(path, queryParameters: queryParameters);
        }
      default:
        {
          log('MissingPluginException: ${call.method}');
          throw MissingPluginException();
        }
    }
  }
}
