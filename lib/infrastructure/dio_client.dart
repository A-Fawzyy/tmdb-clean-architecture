import 'package:dio/dio.dart';
import 'package:tmdb_clean_architecture/infrastructure/base_network_client.dart';
import 'package:tmdb_clean_architecture/util/constants.dart';

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
