import 'package:BuildTek/constants/api_constants.dart';
import 'package:BuildTek/models/constants/api_response_model.dart';
import 'package:BuildTek/models/feature%20models/book/book_model.dart';
import 'package:BuildTek/services/api_service.dart';

class BooksService {
  final ApiService apiService;

  BooksService({required this.apiService});

  Future<ApiResponse<FetchBookModel>> fetchAllBooks() async {
    try {
      final response = await apiService.get(
        ApiEndpoints.fetchAllBooks,
        (json) => FetchBookModel.fromJson(json),
      );
      return response;
    } catch (e) {
      return ApiResponse(error: e.toString());
    }
  }
}
