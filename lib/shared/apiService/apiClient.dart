// 1. Make N/w call
// 2. API gets hit
// 3. Grab the JSON
// 4. Convert Json to Object

// ignore_for_file: file_names

import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  get(url) {
    return _dio.get(url);
  }

  post(data, url) {
    return _dio.post(url, data: data);
  }

  put() {}
  delete() {}
}
