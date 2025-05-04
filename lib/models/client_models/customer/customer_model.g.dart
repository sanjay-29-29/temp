// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetailsModel _$CustomerDetailsModelFromJson(
  Map<String, dynamic> json,
) => CustomerDetailsModel(
  id: json['_id'] as String,
  book: json['book'] as String,
  customerType: json['customerType'] as String,
  customerName: json['customerName'] as String,
  officeNumber: (json['officeNumber'] as num).toInt(),
  emailAddress: json['emailAddress'] as String,
  gstNumber: json['gstNumber'] as String,
  employee: json['employee'] as String,
  contactPersons:
      (json['contactPersons'] as List<dynamic>?)
          ?.map((e) => ContactPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
  status: json['status'] as String,
  customerId: json['customerId'] as String,
  project:
      (json['project'] as List<dynamic>?)
          ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
  address:
      json['address'] == null
          ? null
          : AddressDetailsModel.fromJson(
            json['address'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$CustomerDetailsModelToJson(
  CustomerDetailsModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'book': instance.book,
  'customerType': instance.customerType,
  'customerName': instance.customerName,
  'officeNumber': instance.officeNumber,
  'emailAddress': instance.emailAddress,
  'gstNumber': instance.gstNumber,
  'employee': instance.employee,
  'contactPersons': instance.contactPersons?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'customerId': instance.customerId,
  'project': instance.project?.map((e) => e.toJson()).toList(),
  'address': instance.address?.toJson(),
};
