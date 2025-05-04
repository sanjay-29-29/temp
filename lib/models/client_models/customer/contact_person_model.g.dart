// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactPerson _$ContactPersonFromJson(Map<String, dynamic> json) =>
    ContactPerson(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      phoneNo: (json['phoneNo'] as num).toInt(),
      designation: json['designation'] as String,
      email: json['email'] as String,
      customer: json['customer'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$ContactPersonToJson(ContactPerson instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'phoneNo': instance.phoneNo,
      'designation': instance.designation,
      'email': instance.email,
      'customer': instance.customer,
      'status': instance.status,
    };
