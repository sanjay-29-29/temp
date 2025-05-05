import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/services/storage/store_service.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({super.key});

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  late String message;
  String username = "User";

  @override
  void initState() {
    super.initState();
    _setMessage();
    _fetchEmployeeInfo();
  }

  void _setMessage() {
    final hour = DateTime.now().hour;
    message =
        hour < 12
            ? "GOOD MORNING"
            : hour < 17
            ? "GOOD AFTERNOON"
            : "GOOD EVENING";
  }

  Future<void> _fetchEmployeeInfo() async {
    try {
      final UserDetails user = await StoreService.getEmployeeData();
      setState(() {
        username = user.user.displayName ?? 'User';
      });
    } catch (error) {
      print("Error fetching employee Display Name: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 366,
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveContainer(
            width: 366,
            height: 17,
            child: ResponsiveText(
              message,
              style: StyleConstants.profileTextStyle,
            ),
          ),
          ResponsiveContainer(
            width: 366,
            height: 53,
            child: ResponsiveText(
              username,
              style: StyleConstants.customStyle(
                44,
                Colors.white,
                FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
