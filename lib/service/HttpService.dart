import 'package:dio/dio.dart';
import 'package:winners/shared/data/AppStore.dart';

class HttpService {
  static final HttpService _instance = HttpService._internal();

  factory HttpService() {
    return _instance;
  }

  late Dio _dio;
  final String baseUrl = 'http://10.0.2.2:8000/api/';

  HttpService._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      responseType: ResponseType.json,
    );
    _dio = Dio(options);
  }

  Future<Response> post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers ??= {};

    final authorization = await getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    final response = await _dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);

    // print("My response is ${response.toString()}");
    // print("My response is ${response.data()}");
    // print("My response code is ${response.statusCode}");
    // print("My response header is ${response.headers}");
    // print("My response requestOption is ${response.requestOptions}");

    return response;
  }

  Future<Response> update(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers ??= {};

    final authorization = await getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    final response = await _dio.put(path,
        data: data, queryParameters: queryParameters, options: requestOptions);

    // print("My response is ${response.toString()}");
    // print("My response code is ${response.statusCode}");
    // print("My response header is ${response.headers}");
    // print("My response requestOption is ${response.requestOptions}");

    return response;
  }

  Future<Map<String, dynamic>?> getAuthorizationHeader() async {
    var header = <String, dynamic>{};
    var accessToken = await AppStore.getUserToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      header['Authorization'] = 'Bearer $accessToken';
    }

    return header;
  }

  Future<Response> get(String endpoint) async {
    Options requestOptions = Options();
    requestOptions.headers ??= {};

    final authorization = await getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    final response = await _dio.get(endpoint, options: requestOptions);

    // print("My response is ${response.toString()}");
    // print("My response code is ${response.statusCode}");
    // print("My response header is ${response.headers}");
    // print("My response requestOption is ${response.requestOptions.headers}");

    return response;
  }
}
