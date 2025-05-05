import 'package:BuildTek/bloc/features/book/book_bloc.dart';
import 'package:BuildTek/bloc/features/book/book_event.dart';
import 'package:BuildTek/config/toastication_config.dart';
import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/feature%20models/book/book_model.dart';
import 'package:BuildTek/services/storage/store_service.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationDisplayWidget extends StatefulWidget {
  const LocationDisplayWidget({super.key});

  @override
  State<LocationDisplayWidget> createState() => _LocationDisplayWidgetState();
}

class _LocationDisplayWidgetState extends State<LocationDisplayWidget> {
  List<BookModel> booksList = [];
  BookModel? selectedBook;
  String employeeId = '';

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  void _fetchBooks() async {
    try {
      final UserDetails user = await StoreService.getEmployeeData();
      booksList = user.employee.data.books;
      employeeId = user.employee.data.id;
      setState(() {
        if (booksList.isNotEmpty) {
          selectedBook = booksList[0];
          context.read<BookBloc>().add(
            CurrectBookOfEmployee(bookModel: booksList[0]),
          );
          // context.read<MarketingDeptBloc>().add(
          //   FetchCustomerByBookAndEmployee(
          //     employee: employeeId,
          //     book: selectedBook!.id,
          //   ),
          // );
        }
      });
    } catch (error) {
      toaster.showError(title: '$error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ResponsiveContainer(
        width: 123,
        height: 32,
        padding: const [8, 0, 8, 0],
        decoration: BoxDecoration(
          color: AppColors.decorationColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<BookModel>(
            value: selectedBook,
            icon: Image.asset(
              AssetConstants.downArrowIcon,
              width: 16,
              height: 16,
              color: AppColors.buttonColor,
            ),
            iconSize: 16,
            elevation: 16,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.decorationColor,
            ),
            dropdownColor: AppColors.decorationColor,
            onChanged: (BookModel? newBook) {
              setState(() {
                selectedBook = newBook;
                context.read<BookBloc>().add(
                  CurrectBookOfEmployee(bookModel: newBook!),
                );
              });
              // context.read<MarketingDeptBloc>().add(
              //   FetchCustomerByBookAndEmployee(
              //     employee: employeeId,
              //     book: newBook!.id,
              //   ),
              // );
            },
            items:
                booksList.map<DropdownMenuItem<BookModel>>((BookModel book) {
                  return DropdownMenuItem<BookModel>(
                    value: book,
                    child: ResponsiveText(
                      book.name!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonColor,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
