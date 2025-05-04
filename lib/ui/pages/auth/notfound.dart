import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/auth/not_found_field.dart';

class UserNotFountPage extends StatelessWidget {
  static const String route = '/user-not-found';
  final String userName;
  const UserNotFountPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AddErrorFrame(image: AssetConstants.errorImage),
                ResponsiveSizedBox(width: 0, height: 40),
                ResponsiveContainer(
                  width: 414,
                  height: 213,
                  padding: [24, 0, 24, 2],
                  child: InfoFiled(userName: userName),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: UserNotFoundBottom(),
          )
        ],
      ),
    );
  }
}

class AddErrorFrame extends StatelessWidget {
  final String image;
  const AddErrorFrame({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 414,
      height: 443,
      color: AppColors.backgroundColor,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AssetConstants.gridImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserNotFoundBottom extends StatelessWidget {
  const UserNotFoundBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 414,
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.skyBlueBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      padding: [0, 40, 0, 40],
      child: Center(
        child: Column(
          children: [
            ResponsiveText(
              'Not able to Login?',
              style: StyleConstants.customStyle(
                  14, Color.fromRGBO(0, 83, 128, 1), FontWeight.w400),
            ),
            ResponsiveText(
              'Contact your Admin',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(0, 83, 128, 1),
                fontWeight: FontWeight.w600,
                // decoration:
              ),
            ),
          ],
        ),
      ),
    );
  }
}
