// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
  id: json['_id'] as String,
  name: json['name'] as String?,
  bookId: json['bookId'] as String?,
  location: json['location'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: (json['__v'] as num?)?.toInt(),
);

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'bookId': instance.bookId,
  'location': instance.location,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  '__v': instance.v,
};

FetchBookModel _$FetchBookModelFromJson(Map<String, dynamic> json) =>
    FetchBookModel(
      books:
          (json['books'] as List<dynamic>)
              .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$FetchBookModelToJson(FetchBookModel instance) =>
    <String, dynamic>{'books': instance.books};
