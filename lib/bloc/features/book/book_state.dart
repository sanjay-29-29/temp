import 'package:BuildTek/models/feature%20models/book/book_model.dart';
import 'package:equatable/equatable.dart';

class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final FetchBookModel books;

  const BookLoaded({required this.books});

  @override
  List<Object> get props => [books];
}

class CurrentBookState extends BookState {
  final BookModel book;

  const CurrentBookState({required this.book});

  @override
  List<Object> get props => [book];
}

class BookError extends BookState {
  final String error;

  const BookError({required this.error});

  @override
  List<Object> get props => [error];
}
