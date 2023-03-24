
import 'native_network_plugin_platform_interface.dart';

class NativeNetworkPlugin {

  Future<String?> get(String path,
          {Map<String, dynamic>? queryParameters}) async =>
      NativeNetworkPluginPlatform.instance
          .getRequest(path, queryParameters: queryParameters);
}
