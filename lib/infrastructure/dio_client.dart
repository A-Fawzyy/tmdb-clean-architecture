import 'package:dio/dio.dart';
import 'package:platform_channels_challenge/infrastructure/base_network_client.dart';
import 'package:platform_channels_challenge/util/constants.dart';

class DioClient extends BaseNetworkClient{
  final Dio _dio;

  DioClient(this._dio);

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        Constants.baseUrl + path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioError {
      rethrow;
    }
  }
}
