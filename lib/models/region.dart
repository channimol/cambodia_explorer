import 'package:cambodia_explorer/models/region_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart';
import 'package:async/async.dart';
import 'dart:convert';

part 'region.g.dart';

class RegionRequest {
  static Future<RegionResponse> getRegion(String keyword) async {
    Response response = await get(
        'https://geoapi.asoradev.com/api/geo/region-explorer?keyword=' +
            keyword,
        headers: {"Accept": "application/json"});
    return RegionResponse.fromJson(json.decode(response.body));
  }
}

@JsonSerializable()
class RegionResponse {
  final String status;
  final List<Region> result;

  RegionResponse(this.status, this.result);
  factory RegionResponse.fromJson(Map<String, dynamic> json) =>
      _$RegionResponseFromJson(json);
}

@JsonSerializable()
class Region {
  final int id;
  final String code;

  @JsonKey(name: 'name_latin')
  final String nameLatin;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(nullable: true)
  final Region parent;

  @JsonKey(name: 'region_type')
  final RegionType regionType;

  Region(this.id, this.code, this.nameLatin, this.nameKh, this.parent,
      this.regionType);

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}
