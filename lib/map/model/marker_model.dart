import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'marker_model.g.dart';

@JsonSerializable()
class MarkerModel {
  final String name;
  final Map<String, int> price;
  final Map<String, String> time;
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  final GeoPoint where;

  MarkerModel({
    required this.name,
    required this.price,
    required this.time,
    required this.where,
  });

  @override
  String toString() => 'MarkerModel : {name : $name, price : $price, time : $time, where : {lat : ${where.latitude}, lon : ${where.longitude}}';

  static GeoPoint _fromJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  static GeoPoint _toJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  factory MarkerModel.fromJson(Map<String, dynamic> json) =>
      _$MarkerModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarkerModelToJson(this);
}
