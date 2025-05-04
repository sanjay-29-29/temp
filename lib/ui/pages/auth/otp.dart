import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/models/auth/otp_model.dart';
import 'package:BuildTek/ui/frames/auth/login_frame.dart';
import 'package:BuildTek/ui/widgets/auth/custom_button.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  static const String route = '/otp';

  final OtpModel otpModel;

  const OTPPage({super.key, required this.otpModel});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> otpControllers =
        List.generate(4, (index) => TextEditingController());
    final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

    bool isButtonEnabled = false;

    void _onOtpChanged(int index, String value) {
      if (value.isNotEmpty && index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else if (value.isEmpty && index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
      bool allFilled =
          otpControllers.every((controller) => controller.text.isNotEmpty);
      setState(() {
        isButtonEnabled = allFilled;
      });
    }

    // @override
    // void dispose() {
    //   for (var controller in otpControllers) {
    //     controller.dispose();
    //   }
    //   for (var node in focusNodes) {
    //     node.dispose();
    //   }
    //   super.dispose();
    // }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ResponsiveContainer(
                    width: 414,
                    height: 447,
                    child: FrameLogin(
                      gridImagePath: AssetConstants.gridImage,
                      name:
                          '${widget.otpModel.user.firstName} ${widget.otpModel.user.lastName}',
                      role: widget.otpModel.user.role.roleName,
                      department: widget.otpModel.user.department.name,
                      image: widget.otpModel.user.image,
                      topic: 'OTP Verification',
                      phoneNo: widget.otpModel.user.phoneNo,
                    ),
                  ),
                  const ResponsiveSizedBox(width: 0, height: 120),
                  ResponsiveContainer(
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
                                16, Colors.white, FontWeight.w500),
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors
                                        .notificationCountBackgroundColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors
                                        .notificationCountBackgroundColor),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors
                                        .notificationCountBackgroundColor),
                              ),
                            ),
                            onChanged: (value) => _onOtpChanged(index, value),
                          ),
                        );
                      }),
                    ),
                  ),
                  const ResponsiveSizedBox(height: 20, width: 0),
                  CustomButton(
                    label: 'Verify OTP',
                    onPressed: () {
                      String otpCode = otpControllers
                          .map((controller) => controller.text)
                          .join();
                      logger.i('OTP Code: $otpCode');
                    },
                    isEnabled: isButtonEnabled,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
