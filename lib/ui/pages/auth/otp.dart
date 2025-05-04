import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:BuildTek/bloc/auth/login/login_bloc.dart';
import 'package:BuildTek/bloc/auth/login/login_event.dart';
import 'package:BuildTek/bloc/auth/login/login_state.dart';

import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/config/toastication_config.dart';

import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';

import 'package:BuildTek/models/auth/otp_model.dart';

import 'package:BuildTek/ui/frames/auth/login_frame.dart';
import 'package:BuildTek/ui/widgets/auth/custom_button.dart';
import 'package:BuildTek/ui/widgets/common/loading.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';

class OTPPage extends StatefulWidget {
  static const String route = '/otp-page';
  final String phoneNo;

  const OTPPage({super.key, required this.phoneNo});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  OtpModel otpModel = OtpModel(
    user: UserIdentityModel(
      firstName: "User",
      lastName: "",
      phoneNo: "98*******10",
      department: DepartmentBeforeLogin(name: "DEPT"),
      role: RoleBeforeLogin(roleName: "ROLE"),
      isPasswordSet: false,
    ),
    message: MessageModel(
      verificationId: "",
      mobileNumber: "",
      responseCode: "",
      timeout: "",
      transactionId: "",
    ),
  );

  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  bool isButtonEnabled = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    context.read<AuthLoginBloc>().add(AuthGetOTPEvent(phoneNo: widget.phoneNo));
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void onOtpChanged(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }

    setState(() {
      isButtonEnabled = otpControllers.every(
        (controller) => controller.text.isNotEmpty,
      );
    });
  }

  void onOtpSubmit() {
    final otpCode = otpControllers.map((controller) => controller.text).join();
    logger.i('OTP Code: $otpCode');

    context.read<AuthLoginBloc>().add(
      AuthSubmitOTPEvent(
        otpCode: otpCode,
        phoneNo: widget.phoneNo,
        verificationId: otpModel.message.verificationId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocListener<AuthLoginBloc, AuthLoginState>(
        listener: (context, state) {
          setState(() => isLoading = state is AuthLoginLoadingState);
          if (state is AuthOTPSendSuccessState) {
            otpModel = state.otpModel;
            toaster.showInfo(title: state.message);
          } else if (state is AuthOTPSendErrorState) {
            toaster.showError(title: state.message);
          } else if (state is AuthOTPVerificationSuccessState) {
            toaster.showSuccess(title: state.message);
            context.go(state.route, extra: state.userIdentityModel);
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ResponsiveContainer(
                      width: 414,
                      height: 447,
                      child: FrameLogin(
                        gridImagePath: AssetConstants.gridImage,
                        name:
                            '${otpModel.user.firstName} ${otpModel.user.lastName}',
                        role: otpModel.user.role.roleName,
                        department: otpModel.user.department.name,
                        image: otpModel.user.image,
                        topic: 'OTP Verification',
                        phoneNo: otpModel.user.phoneNo,
                      ),
                    ),
                    const ResponsiveSizedBox(width: 0, height: 120),
                    _buildOtpFields(),
                    const ResponsiveSizedBox(height: 20, width: 0),
                    CustomButton(
                      label: 'Verify OTP',
                      onPressed: onOtpSubmit,
                      isEnabled: isButtonEnabled,
                    ),
                  ],
                ),
              ),
            ),
            if (isLoading) const CircleLoadingWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpFields() {
    return ResponsiveContainer(
      width: 250,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return SizedBox(
            width: 40,
            child: TextField(
              controller: otpControllers[index],
              focusNode: focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              style: StyleConstants.customStyle(
                16,
                Colors.white,
                FontWeight.w500,
              ),
              decoration: InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.notificationCountBackgroundColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.notificationCountBackgroundColor,
                  ),
                ),
              ),
              onChanged: (value) => onOtpChanged(index, value),
            ),
          );
        }),
      ),
    );
  }
}
