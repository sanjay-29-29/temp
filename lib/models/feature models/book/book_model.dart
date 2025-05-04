import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String? name;
  final String? bookId;
  final String? location;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  const BookModel({
    required this.id,
    this.name,
    this.bookId,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        bookId,
        location,
        createdAt,
        updatedAt,
        v,
      ];

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}

@JsonSerializable()
class FetchBookModel extends Equatable {
  final List<BookModel> books;

  const FetchBookModel({
    required this.books,
  });
  @override
  List<Object?> get props => [books];
  factory FetchBookModel.fromJson(List<dynamic> json) => FetchBookModel(
      books: json
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList());

  List<dynamic> toJson() => books.map((e) => e.toJson()).toList();
}
