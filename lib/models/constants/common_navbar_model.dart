import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_navbar_model.g.dart';

@JsonSerializable()
class NavigationItemModel extends Equatable {
  final String iconPath;
  final String label;
  final int index;

  const NavigationItemModel({
    required this.iconPath,
    required this.label,
    required this.index,
  });

  @override
  List<Object?> get props => [iconPath, label, index];

  factory NavigationItemModel.fromJson(Map<String, dynamic> json) =>
      _$NavigationItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$NavigationItemModelToJson(this);
}