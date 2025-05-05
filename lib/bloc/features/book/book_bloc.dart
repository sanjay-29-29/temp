import 'package:BuildTek/bloc/features/book/book_event.dart';
import 'package:BuildTek/bloc/features/book/book_state.dart';
import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/respositories/book/book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc({required this.bookRepository}) : super(BookInitial()) {
    on<FetchAllBooksEvent>(_onFetchAllBooksEvent);
    on<CurrectBookOfEmployee>(_onCurrectBookOfEmployee);
  }

  void _onFetchAllBooksEvent(
    FetchAllBooksEvent event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      final response = await bookRepository.fetchAllBooks();
      if (response.success == true) {
        emit(BookLoaded(books: response.data!));
      } else {
        emit(BookError(error: response.message));
      }
    } catch (e) {
      emit(BookError(error: e.toString()));
    }
  }

  void _onCurrectBookOfEmployee(
    CurrectBookOfEmployee event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      emit(CurrentBookState(book: event.bookModel));
    } catch (e) {
      logger.e('Error at Current Book Bloc $e');
      emit(BookError(error: e.toString()));
    }
  }
}
