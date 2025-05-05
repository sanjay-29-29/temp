// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_navbar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigationItemModel _$NavigationItemModelFromJson(Map<String, dynamic> json) =>
    NavigationItemModel(
      iconPath: json['iconPath'] as String,
      label: json['label'] as String,
      index: (json['index'] as num).toInt(),
    );

Map<String, dynamic> _$NavigationItemModelToJson(
  NavigationItemModel instance,
) => <String, dynamic>{
  'iconPath': instance.iconPath,
  'label': instance.label,
  'index': instance.index,
};
