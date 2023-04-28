// ignore_for_file: file_names, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'SongModel.g.dart';

@JsonSerializable()
class Song {
  @JsonKey(name: 'trackName')
  String? name;
  @JsonKey(name: 'artworkUrl100')
  String? photo;
  @JsonKey(name: 'previewUrl')
  String? preview;

  static Song SongFromJSON(Map<String, dynamic> map) => _$SongFromJson(map);
}
