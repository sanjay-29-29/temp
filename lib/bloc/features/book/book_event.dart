import 'package:BuildTek/models/feature%20models/book/book_model.dart';
import 'package:equatable/equatable.dart';

class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object?> get props => [];
}

class FetchAllBooksEvent extends BookEvent {
  @override
  List<Object?> get props => [];
}

class CurrectBookOfEmployee extends BookEvent {
  final BookModel bookModel;

  const CurrectBookOfEmployee({required this.bookModel});

  @override
  List<Object?> get props => [bookModel];
}