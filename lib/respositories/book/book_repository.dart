import 'package:BuildTek/services/books/books_service.dart';

class BookRepository {
  final BooksService bookService;

  BookRepository({required this.bookService});

  Future fetchAllBooks() async {
    return await bookService.fetchAllBooks();
  }
}
