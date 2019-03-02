// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionResponse _$RegionResponseFromJson(Map<String, dynamic> json) {
  return RegionResponse(
      json['status'] as String,
      (json['result'] as List)
          ?.map((e) =>
              e == null ? null : Region.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$RegionResponseToJson(RegionResponse instance) =>
    <String, dynamic>{'status': instance.status, 'result': instance.result};

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
      json['id'] as int,
      json['code'] as String,
      json['name_latin'] as String,
      json['name_kh'] as String,
      json['parent'] == null
          ? null
          : Region.fromJson(json['parent'] as Map<String, dynamic>),
      json['region_type'] == null
          ? null
          : RegionType.fromJson(json['region_type'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name_latin': instance.nameLatin,
      'name_kh': instance.nameKh,
      'parent': instance.parent,
      'region_type': instance.regionType
    };
