import 'package:BuildTek/bloc/auth/login/login_bloc.dart';
import 'package:BuildTek/bloc/auth/login/login_state.dart';
import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/ui/widgets/auth/forgetpasswrod_field.dart';
import 'package:BuildTek/ui/widgets/common/loading.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../frames/auth/login_frame.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const String route = '/forget-password';
  final String userName;

  const ForgetPasswordPage({super.key, required this.userName});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool isLoading = false;
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
        },
        child: Stack(
          children: [
            Column(
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
                ForgetPasswordField(username: widget.userName),
              ],
            ),
            if (isLoading) CircleLoadingWidget(),
          ],
        ),
      ),
    );
  }
}
