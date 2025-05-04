import 'package:BuildTek/bloc/auth/login/login_bloc.dart';
import 'package:BuildTek/bloc/auth/login/login_event.dart';
import 'package:BuildTek/bloc/auth/login/login_state.dart';
import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/config/toastication_config.dart';
import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/ui/frames/auth/login_frame.dart';
import 'package:BuildTek/ui/widgets/auth/auth_input_field.dart';
import 'package:BuildTek/ui/widgets/auth/custom_button.dart';
import 'package:BuildTek/ui/widgets/common/loading.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool isLoading = false;

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
    final isValidEmail = RegExp(
      r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$",
    ).hasMatch(text);
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
      body: BlocListener<AuthLoginBloc, AuthLoginState>(
        listener: (context, state) {
          if (state is AuthLoginLoadingState) {
            setState(() {
              isLoading = true;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
          if (state is AuthUserIdentitySuccess) {
            context.go(state.route, extra: state.userIdentityModel);
          } else if (state is AuthUserNotFoundState) {
            context.go(state.route, extra: _userNameController.text);
            toaster.showInfo(title: "User Not Found", msg: state.message);
          } else if (state is AuthLoginErrorState) {
            toaster.showError(title: state.message);
          }
        },
        child: Stack(
          children: [
            SingleChildScrollView(
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
                            context.read<AuthLoginBloc>().add(
                              SubmitUserNameEvent(
                                username: _userNameController.text,
                              ),
                            );
                          },
                          isEnabled: isButtonEnabled,
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
