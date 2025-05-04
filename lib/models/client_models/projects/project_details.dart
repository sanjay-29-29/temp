import 'package:json_annotation/json_annotation.dart';

part 'project_details.g.dart';

@JsonSerializable()
class Project {
  @JsonKey(name: "_id")
  final String id;
  final String projectName;
  final List<String> projectContactPersons;
  final String billingAddress;
  final String customer;
  final String employee;
  final String status;
  final String projectId;
  final List<String>? lead;

  Project({
    required this.id,
    required this.projectName,
    required this.projectContactPersons,
    required this.billingAddress,
    required this.customer,
    required this.employee,
    required this.status,
    required this.projectId,
    this.lead,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
