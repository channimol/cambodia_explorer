import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart';
import 'package:async/async.dart';
import 'dart:convert';

part 'region_type.g.dart';

@JsonSerializable()
class RegionType {
  final int id;

  @JsonKey(name: 'name_latin')
  final String nameLatin;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  RegionType(this.id, this.nameLatin, this.nameKh);

  factory RegionType.fromJson(Map<String, dynamic> json) => _$RegionTypeFromJson(json);
}
