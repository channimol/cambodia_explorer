// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionType _$RegionTypeFromJson(Map<String, dynamic> json) {
  return RegionType(json['id'] as int, json['name_latin'] as String,
      json['name_kh'] as String);
}

Map<String, dynamic> _$RegionTypeToJson(RegionType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_latin': instance.nameLatin,
      'name_kh': instance.nameKh
    };
