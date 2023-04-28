// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

part 'SingerModel.g.dart';

@JsonSerializable()
class Singer {
  late String name;
  late String photo;

  // ignore: non_constant_identifier_names
  static Singer SingerFromJSON(Map<String, dynamic> map) =>
      _$SingerFromJson(map);
}
