import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:musicappnew/modules/songs/Model/SongModel.dart';
import 'package:musicappnew/shared/apiService/apiclient.dart';
import 'package:musicappnew/shared/config.dart';

class SongService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Song>> getSongs(String singerName) async {
    final url = Constants.getURL(singerName);
    Response response = await _apiClient.get(url);

    dynamic object = jsonDecode(response.data);

    List<dynamic> list = object["results"];
    List<Song> songs = list.map((e) => Song.SongFromJSON(e)).toList();

    return songs;
  }
}
