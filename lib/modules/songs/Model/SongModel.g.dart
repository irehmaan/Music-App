// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'SongModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song()
  ..name = json['trackName'] ?? ''
  ..photo = json['artworkUrl100'] ?? ''
  ..preview = json['previewUrl'] ?? '';

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'trackName': instance.name,
      'artworkUrl100': instance.photo,
      'previewUrl': instance.preview,
    };
