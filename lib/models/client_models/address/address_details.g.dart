// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDetailsModel _$AddressDetailsModelFromJson(Map<String, dynamic> json) =>
    AddressDetailsModel(
      id: json['_id'] as String?,
      customer: json['customer'] as String?,
      projectAddress: json['projectAddress'] as String?,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      pincode: (json['pincode'] as num).toInt(),
      location: LocationLatLong.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      status: json['status'] as String?,
      landMark: json['landMark'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$AddressDetailsModelToJson(
  AddressDetailsModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'customer': instance.customer,
  'projectAddress': instance.projectAddress,
  'address': instance.address,
  'city': instance.city,
  'state': instance.state,
  'pincode': instance.pincode,
  'location': instance.location.toJson(),
  'landMark': instance.landMark,
  'status': instance.status,
  'country': instance.country,
};
