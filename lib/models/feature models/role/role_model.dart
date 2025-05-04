import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role_model.g.dart';

@JsonSerializable()
class RoleModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String roleName;
  final List<String>? permissions;
  final String? createdAt;
  final String? updatedAt;
  final String? roleId;
  @JsonKey(name: '__v')
  final int? v;

  const RoleModel({
    required this.id,
    required this.roleName,
    this.permissions,
    this.createdAt,
    this.roleId,
    this.updatedAt,
    this.v,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoleModelToJson(this);

  @override
  List<Object?> get props => [id, roleName, permissions, roleId];
}

@JsonSerializable()
class FetchRoleModel extends Equatable {
  final List<RoleModel> role;

  const FetchRoleModel({
    required this.role,
  });
  @override
  List<Object?> get props => [role];
  factory FetchRoleModel.fromJson(List<dynamic> json) => FetchRoleModel(
      role: json
          .map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
          .toList());

  List<dynamic> toJson() => role.map((e) => e.toJson()).toList();

  bool get isEmpty => role.isEmpty;

  RoleModel firstWhere(bool Function(RoleModel item) test,
      {required RoleModel Function() orElse}) {
    try {
      return role.firstWhere(test, orElse: orElse);
    } catch (e) {
      return orElse();
    }
  }
}
