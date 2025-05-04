import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType inputType;
  final bool isPassword;
  final bool showPassword;
  final VoidCallback? onToggleVisibility;
  final bool hasText;
  final bool isValid;
  final String? username;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.inputType,
    required this.hintText,
    this.isPassword = false,
    this.showPassword = false,
    this.onToggleVisibility,
    this.hasText = false,
    this.isValid = true,
    this.username,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 366,
      height: isPassword ? 92 : 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveText(
            label,
            style: StyleConstants.textFieldStyle,
          ),
          ResponsiveContainer(
            width: 366,
            height: 38,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.borderColor,
                ),
              ),
            ),
            child: TextField(
              controller: controller,
              keyboardType: inputType,
              maxLines: 1,
              textAlign: TextAlign.center,
              obscureText: isPassword ? !showPassword : false,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: StyleConstants.hintTextStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style:
                  StyleConstants.customStyle(18, Colors.white, FontWeight.w500),
            ),
          ),
          if (isPassword)
            ResponsiveContainer(
              width: 366,
              height: 34,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (username != null) ForgotPasswordLink(userName: username!),
                  ShowHidePasswordButton(
                    showPassword: showPassword,
                    onTap: onToggleVisibility ?? () {},
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class ForgotPasswordLink extends StatelessWidget {
  final String userName;
  const ForgotPasswordLink({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 135,
      height: 50,
      padding: [0, 0, 0, 0],
      child: TextButton(
        onPressed: () {
          context.goNamed("forgetPassword", extra: userName);
        },
        child: const ResponsiveText(
          'Forgot password?',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            color: Color.fromRGBO(168, 219, 235, 1),
            decoration: TextDecoration.underline,
            decorationColor: Color.fromRGBO(168, 219, 235, 1),
          ),
        ),
      ),
    );
  }
}

class ShowHidePasswordButton extends StatelessWidget {
  final bool showPassword;
  final VoidCallback onTap;

  const ShowHidePasswordButton(
      {super.key, required this.showPassword, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ResponsiveContainer(
        width: showPassword ? 73 : 67,
        height: 24,
        padding: [8, 4, 8, 4],
        decoration: BoxDecoration(
          color: showPassword
              ? const Color.fromRGBO(168, 219, 235, 1)
              : const Color.fromRGBO(1, 32, 78, 1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveText(
              showPassword ? 'Hide' : 'Show',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
                color: showPassword
                    ? const Color.fromRGBO(1, 32, 78, 1)
                    : const Color.fromRGBO(168, 219, 235, 1),
              ),
            ),
            Image.asset(
              showPassword
                  ? AssetConstants.eyeCloseIcon
                  : AssetConstants.eyeOpenIcon,
              width: 16,
              height: 16,
              color: showPassword
                  ? const Color.fromRGBO(1, 32, 78, 1)
                  : const Color.fromRGBO(168, 219, 235, 1),
            )
          ],
        ),
      ),
    );
  }
}
