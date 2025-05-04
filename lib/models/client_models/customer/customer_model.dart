import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../address/address_details.dart';
import '../projects/project_details.dart';
import 'contact_person_model.dart';

part 'customer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerDetailsModel extends Equatable {
  @JsonKey(name: "_id")
  final String id;
  final String book;
  final String customerType;
  final String customerName;
  final int officeNumber;
  final String emailAddress;
  final String gstNumber;
  final String employee;
  final List<ContactPerson>? contactPersons;
  final String status;
  final String customerId;
  final List<Project>? project;
  final AddressDetailsModel? address;

  const CustomerDetailsModel({
    required this.id,
    required this.book,
    required this.customerType,
    required this.customerName,
    required this.officeNumber,
    required this.emailAddress,
    required this.gstNumber,
    required this.employee,
    required this.contactPersons,
    required this.status,
    required this.customerId,
    required this.project,
    this.address,
  });

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        book,
        customerType,
        customerName,
        officeNumber,
        emailAddress,
        gstNumber,
        employee,
        contactPersons,
        status,
        customerId,
        project,
        address
      ];
}
