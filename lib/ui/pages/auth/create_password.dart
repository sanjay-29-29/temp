import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/ui/frames/auth/login_frame.dart';
import 'package:BuildTek/ui/widgets/auth/auth_input_field.dart';
import 'package:BuildTek/ui/widgets/auth/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../models/auth/user_identity_model.dart';
import '../../wrapper_class/response_sizedbox.dart';
import '../../wrapper_class/responseive_container.dart';

class CreatePasswordPage extends StatefulWidget {
  static const String route = '/create-password';

  final UserIdentityModel usernameDetails;

  const CreatePasswordPage({super.key, required this.usernameDetails});

  @override
  State<StatefulWidget> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final TextEditingController createpasswordController =
      TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    createpasswordController.addListener(_updateState);
    conformPasswordController.addListener(_updateState);
  }

  @override
  void dispose() {
    createpasswordController.removeListener(_updateState);
    conformPasswordController.removeListener(_updateState);
    createpasswordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

  void _updateState() {
    if (createpasswordController.text == conformPasswordController.text &&
        createpasswordController.text.isNotEmpty &&
        createpasswordController.text.length > 8) {
      setState(() {
        isButtonEnabled = true;
      });
    } else {
      setState(() {
        isButtonEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF023E8A),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveContainer(
                    width: 414,
                    height: 447,
                    child: FrameLogin(
                      gridImagePath: AssetConstants.gridImage,
                      name:
                          '${widget.usernameDetails.firstName} ${widget.usernameDetails.lastName}',
                      role: widget.usernameDetails.role.roleName,
                      department: widget.usernameDetails.department.name,
                      image: widget.usernameDetails.image,
                      topic: 'SET PASSWORD',
                      phoneNo: widget.usernameDetails.phoneNo,
                    ),
                  ),
                  const SizedBox(height: 140),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomInputField(
                        controller: createpasswordController,
                        label: 'CREATE PASSWORD',
                        inputType: TextInputType.visiblePassword,
                        hintText: 'Enter Your Password',
                      ),
                      const ResponsiveSizedBox(height: 15, width: 0),
                      CustomInputField(
                        controller: conformPasswordController,
                        label: 'CONFORM PASSWORD',
                        inputType: TextInputType.visiblePassword,
                        hintText: 'Re-Enter Your Password',
                      ),
                      const ResponsiveSizedBox(height: 30, width: 0),
                      CustomButton(
                        label: 'Confirm Password',
                        onPressed: () {
                          // context.read<AuthLoginBloc>().add(
                          //       SetPasswordEvent(
                          //         password: createpasswordController.text,
                          //         userId: widget.usernameDetails.phoneNo,
                          //       ),
                          //     );
                        },
                        isEnabled: isButtonEnabled,
                      ),
                    ],
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
