import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';

import '../../frames/auth/login_frame.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const String route = '/forget-password';
  final String userName;

  const ForgetPasswordPage({super.key, required this.userName});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveContainer(
            width: 414,
            height: 430,
            child: const FrameLogin(
              gridImagePath: AssetConstants.gridImage,
              frameImagePath: AssetConstants.frameImage,
            ),
          ),
          
        ],
      ),
    );
  }
}
