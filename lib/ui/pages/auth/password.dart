import 'package:BuildTek/bloc/auth/login/login_bloc.dart';
import 'package:BuildTek/bloc/auth/login/login_event.dart';
import 'package:BuildTek/bloc/auth/login/login_state.dart';
import 'package:BuildTek/config/toastication_config.dart';
import 'package:BuildTek/ui/widgets/auth/auth_input_field.dart';
import 'package:BuildTek/ui/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/models/auth/user_identity_model.dart';
import 'package:BuildTek/ui/frames/auth/login_frame.dart';
import 'package:BuildTek/ui/widgets/auth/custom_button.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PasswordPage extends StatefulWidget {
  static const route = '/password';
  final UserIdentityModel userIdentity;

  const PasswordPage({super.key, required this.userIdentity});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool showPassword = false;
  bool hasPasswordText = false;
  bool isPasswordValid = true;
  bool isButtonEnabled = false;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    emailController.text = widget.userIdentity.email ?? '';
    passwordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    final text = passwordController.text;
    setState(() {
      hasPasswordText = text.isNotEmpty;
      isPasswordValid = text.length >= 8;
      isButtonEnabled = isPasswordValid && hasPasswordText;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocListener<AuthLoginBloc, AuthLoginState>(
        listener: (context, state) {
          if (!mounted) return;

          setState(() {
            isLoading = state is AuthLoginLoadingState;
          });

          if (state is AuthPasswordSuccessState) {
            toaster.showSuccess(title: "Login successful");
            context.go(state.route);
          } else if (state is AuthAddDeviceState) {
            toaster.showInfo(title: "Device not registered");
            context.go(state.route);
          } else if (state is AuthDeviceVerificationSuccessState) {
            toaster.showSuccess(title: state.message);
            context.go(state.route);
          }
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ResponsiveContainer(
                    width: 414,
                    height: 447,
                    child: FrameLogin(
                      gridImagePath: AssetConstants.gridImage,
                      name:
                          '${widget.userIdentity.firstName} ${widget.userIdentity.lastName}',
                      role: widget.userIdentity.role.roleName,
                      department: widget.userIdentity.department.name,
                      image: widget.userIdentity.image,
                      phoneNo: widget.userIdentity.phoneNo,
                    ),
                  ),
                  const ResponsiveSizedBox(width: 0, height: 165),
                  ResponsiveContainer(
                    width: 366,
                    height: 162,
                    child: Column(
                      children: [
                        CustomInputField(
                          controller: passwordController,
                          label: "PASSWORD",
                          inputType: TextInputType.visiblePassword,
                          hintText: "Enter Your Password",
                          isPassword: true,
                          showPassword: showPassword,
                          hasText: hasPasswordText,
                          isValid: isPasswordValid,
                          username: emailController.text,
                          onToggleVisibility: _togglePasswordVisibility,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          label: 'Proceed',
                          isEnabled: isButtonEnabled,
                          onPressed: () {
                            context.read<AuthLoginBloc>().add(
                              SubmitPasswordEvent(
                                password: passwordController.text,
                                username: widget.userIdentity.phoneNo,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isLoading) CircleLoadingWidget(),
          ],
        ),
      ),
    );
  }
}
