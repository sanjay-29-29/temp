import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'latlng_location.g.dart';

@JsonSerializable()
class LocationLatLong extends Equatable {
  final String lat;
  final String lng;

  const LocationLatLong({
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [lat, lng];

  factory LocationLatLong.fromJson(Map<String, dynamic> json) =>
      _$LocationLatLongFromJson(json);

  Map<String, dynamic> toJson() => _$LocationLatLongToJson(this);
}
