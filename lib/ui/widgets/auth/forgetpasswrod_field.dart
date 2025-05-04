import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:flutter/material.dart';

import '../../wrapper_class/response_sizedbox.dart';
import '../../wrapper_class/responseive_container.dart';
import '../../wrapper_class/responsive_text.dart';

class ForgetPasswordField extends StatefulWidget {
  final String username;
  const ForgetPasswordField({super.key, required this.username});

  @override
  State<ForgetPasswordField> createState() => _ForgetPasswordFieldState();
}

class _ForgetPasswordFieldState extends State<ForgetPasswordField> {
  late TextEditingController phoneNoController;
  bool isEditable = false;

  @override
  void initState() {
    super.initState();
    phoneNoController = TextEditingController(text: widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 414,
      height: 463,
      decoration: BoxDecoration(
        color: AppColors.skyBlueBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      padding: [16, 40, 16, 40],
      child: Center(
        child: Column(
          children: [
            ResponsiveText(
              'ASK YOUR ADMIN',
              style: StyleConstants.customStyle(
                  14, Color.fromRGBO(0, 83, 128, 1), FontWeight.w400),
            ),
            ResponsiveSizedBox(width: 0, height: 40),
            _buildEmailAndResetPassword(),
            ResponsiveSizedBox(width: 0, height: 20),
            ResponsiveContainer(
              width: 366,
              height: 48,
              padding: [12, 14, 12, 14],
              child: Center(
                child: ResponsiveText(
                  'Back to Login',
                  style: StyleConstants.customStyle(
                    18,
                    Color.fromRGBO(2, 50, 110, 1),
                    FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailAndResetPassword() {
    return ResponsiveContainer(
      width: 366,
      height: 133,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmailField(),
          _buildResetPasswordButton(),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return ResponsiveContainer(
      width: 366,
      height: 53,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveText(
            'USERNAME',
            style: StyleConstants.customStyle(
                12, Color.fromRGBO(0, 119, 182, 1), FontWeight.w600),
          ),
          Expanded(
            child: TextField(
              controller: phoneNoController,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              style: StyleConstants.customStyle(
                  20, Colors.black, FontWeight.w500),
              readOnly: !isEditable,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isEditable = !isEditable;
              });
            },
            child: Image.asset(
              isEditable ? AssetConstants.editIcon : AssetConstants.taskIcon,
              width: 24,
              height: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResetPasswordButton() {
    return GestureDetector(
      onTap: () {
        if (phoneNoController.text.isEmpty &&
            phoneNoController.text.length < 10 &&
            phoneNoController.text.length > 10) {
          return;
        }
        // context
        //     .read<AuthLoginBloc>()
        //     .add(SendOTPEvent(phoneNo: phoneNoController.text));
      },
      child: ResponsiveContainer(
        width: 366,
        height: 48,
        padding: [12, 14, 12, 14],
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetConstants.lockIcon, width: 24, height: 24),
            ResponsiveText(
              'Reset my password',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(53, 50, 43, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.asset(
              AssetConstants.rightArrowIcon,
              width: 20,
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
