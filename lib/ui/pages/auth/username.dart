import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/config/toastication_config.dart';
import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:BuildTek/ui/frames/auth/login_frame.dart';
import 'package:BuildTek/ui/widgets/auth/auth_input_field.dart';
import 'package:BuildTek/ui/widgets/auth/custom_button.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserNamePage extends StatefulWidget {
  static const route = '/login';

  const UserNamePage({super.key});

  @override
  State<UserNamePage> createState() => _UserNamePageState();
}

class _UserNamePageState extends State<UserNamePage> {
  final TextEditingController _userNameController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(_checkText);
  }

  @override
  void dispose() {
    _userNameController.removeListener(_checkText);
    _userNameController.dispose();
    super.dispose();
  }

  void _checkText() {
    final text = _userNameController.text;
    final isValidEmail =
        RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(text);
    final isValidPhone = RegExp(r'^\d{10}$').hasMatch(text);

    if (isButtonEnabled != (isValidEmail || isValidPhone)) {
      setState(() {
        isButtonEnabled = isValidEmail || isValidPhone;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveContainer(
              width: 414,
              height: 447,
              child: const FrameLogin(
                gridImagePath: AssetConstants.gridImage,
                frameImagePath: AssetConstants.frameImage,
              ),
            ),
            ResponsiveSizedBox(width: 0, height: 165),
            ResponsiveContainer(
              width: 366,
              height: 144,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomInputField(
                    controller: _userNameController,
                    label: 'USERNAME',
                    inputType: TextInputType.emailAddress,
                    hintText: 'Email or Phone',
                  ),
                  CustomButton(
                    label: 'Proceed',
                    onPressed: () {
                      logger.i('email ${_userNameController.text}');
                      toaster.showSuccess(title: "Email Verification Sucess");
                      context.goNamed(
                        'password',
                        extra: UserIdentityModel(
                          firstName: "Sample",
                          lastName: "LastName",
                          phoneNo: "9042252093",
                          department: DepartmentBeforeLogin(name: "Admin"),
                          role: RoleBeforeLogin(roleName: "HOD"),
                          isPasswordSet: true,
                        ),
                      );
                    },
                    isEnabled: isButtonEnabled,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
