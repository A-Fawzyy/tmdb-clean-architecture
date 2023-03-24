import 'package:native_network_plugin/native_network_plugin.dart';
import 'package:tmdb_clean_architecture/infrastructure/base_network_client.dart';
import 'package:tmdb_clean_architecture/util/constants.dart';

class PlatformChannelClient extends BaseNetworkClient {
  PlatformChannelClient(this._client);

  final NativeNetworkPlugin _client;

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _client.get(
      Constants.baseUrl + path,
      queryParameters: queryParameters,
    );
    return response;
  }
}
