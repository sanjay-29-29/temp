import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_person_model.g.dart';

@JsonSerializable()
class ContactPerson extends Equatable {
  @JsonKey(name: "_id")
  final String id;
  final String fullName;
  final int phoneNo;
  final String designation;
  final String email;
  final String? customer;
  final String status;

  const ContactPerson({
    required this.id,
    required this.fullName,
    required this.phoneNo,
    required this.designation,
    required this.email,
    this.customer,
    required this.status,
  });

  factory ContactPerson.fromJson(Map<String, dynamic> json) =>
      _$ContactPersonFromJson(json);

  Map<String, dynamic> toJson() => _$ContactPersonToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, fullName, phoneNo, designation, email, customer, status];
}
