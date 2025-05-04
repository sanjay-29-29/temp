import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfoFiled extends StatelessWidget {
  final String userName;
  const InfoFiled({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 366,
      height: 213,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildEmailDisplay(),
          _buildTryAgainField(context),
        ],
      ),
    );
  }

  Widget _buildEmailDisplay() {
    return ResponsiveContainer(
      width: 366,
      height: 125,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveText(
            'Oops!',
            style: StyleConstants.notFoundTextStyle,
          ),
          ResponsiveText(
            'We can’t find an account \n associated with',
            style: StyleConstants.notFoundTextStyle,
          ),
          ResponsiveText(
            userName,
            style: StyleConstants.customStyle(
                24, Color.fromRGBO(255, 240, 202, 1), FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildTryAgainField(BuildContext context) {
    return ResponsiveContainer(
      width: 366,
      height: 48,
      child: GestureDetector(
        onTap: () {
          context.go('/login');
        },
        child: Center(
          child: ResponsiveText(
            'Try Again',
            style: StyleConstants.customStyle(
                24, Color.fromRGBO(255, 240, 202, 1), FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
