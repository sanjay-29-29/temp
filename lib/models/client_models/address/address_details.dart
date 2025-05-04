import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'latlng_location.dart';

part 'address_details.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressDetailsModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? customer;
  final String? projectAddress;
  final String address;
  final String city;
  final String state;
  final int pincode;
  final LocationLatLong location;
  final String? landMark;
  final String? status;
  final String? country;

  const AddressDetailsModel({
    this.id,
    this.customer,
    this.projectAddress,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.location,
    this.status,
    this.landMark,
    this.country,
  });

  @override
  List<Object?> get props => [
        customer,
        address,
        projectAddress,
        city,
        state,
        pincode,
        location,
        landMark,
        id,
        status,
        country
      ];

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDetailsModelToJson(this);
}
