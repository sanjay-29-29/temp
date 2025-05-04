import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_navbar.g.dart';

@JsonSerializable()
class NavigationItem extends Equatable {
  final String iconPath;
  final String label;
  final int index;

  const NavigationItem({
    required this.iconPath,
    required this.label,
    required this.index,
  });

  @override
  List<Object?> get props => [iconPath, label, index];

  factory NavigationItem.fromJson(Map<String, dynamic> json) =>
      _$NavigationItemFromJson(json);

  Map<String, dynamic> toJson() => _$NavigationItemToJson(this);
}
