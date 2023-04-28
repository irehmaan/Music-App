// ignore_for_file: file_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musicappnew/modules/singers/model/SingerModel.dart';
import 'package:musicappnew/shared/apiService/apiclient.dart';
import 'package:musicappnew/shared/config.dart';

class SingerService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Singer>> getSingers() async {
    String url = Constants.Singers_URL;
    //print(url);

    Response response = await _apiClient.get(url);

    // Here we are getting the data type as string using runtype
    // so we'll convert String(JSON) into Object using JSONDecode
    dynamic object = jsonDecode(response.data);

    List<dynamic> list = object['singers'];
    List<Singer> singer = list.map((e) => Singer.SingerFromJSON(e)).toList();

    return singer;
  }
}
