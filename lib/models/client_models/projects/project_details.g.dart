// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  id: json['_id'] as String,
  projectName: json['projectName'] as String,
  projectContactPersons:
      (json['projectContactPersons'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  billingAddress: json['billingAddress'] as String,
  customer: json['customer'] as String,
  employee: json['employee'] as String,
  status: json['status'] as String,
  projectId: json['projectId'] as String,
  lead: (json['lead'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  '_id': instance.id,
  'projectName': instance.projectName,
  'projectContactPersons': instance.projectContactPersons,
  'billingAddress': instance.billingAddress,
  'customer': instance.customer,
  'employee': instance.employee,
  'status': instance.status,
  'projectId': instance.projectId,
  'lead': instance.lead,
};
