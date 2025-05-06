import 'package:BuildTek/bloc/auth/login/login_bloc.dart';
import 'package:BuildTek/bloc/auth/login/login_event.dart';
import 'package:BuildTek/bloc/auth/login/login_state.dart';
import 'package:BuildTek/config/toastication_config.dart';
import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/devices/add_device_model.dart';
import 'package:BuildTek/models/devices/fetch_device_model.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeviceDetailsButton extends StatefulWidget {
  final FetchDeviceModel device;
  final Employee employee;

  const DeviceDetailsButton({
    super.key,
    required this.device,
    required this.employee,
  });

  @override
  State<DeviceDetailsButton> createState() => _DeviceDetailsButtonState();
}

class _DeviceDetailsButtonState extends State<DeviceDetailsButton> {
  late AddDeviceModel addDevice;

  @override
  void initState() {
    super.initState();
    _initializeAddDevice();
  }

  void _initializeAddDevice() {
    addDevice = AddDeviceModel(
      deviceId: widget.device.deviceId ?? 'N/A',
      deviceMake: widget.device.deviceMake,
      deviceModel: widget.device.deviceModel,
      employee: widget.employee.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthLoginBloc, AuthLoginState>(
      listener: (context, state) {
        if (state is AuthAddDeviceSuccessState) {
          toaster.showSuccess(title: state.message);
          context.go(state.route);
        } else if (state is AuthLoginErrorState) {
          toaster.showError(title: state.message);
        }
      },
      builder: (context, state) {
        final bool isLoading = state is AuthLoginLoadingState;

        return GestureDetector(
          onTap:
              isLoading
                  ? null
                  : () {
                    BlocProvider.of<AuthLoginBloc>(
                      context,
                    ).add(AuthAddDeviceEvent(device: addDevice));
                  },
          child: ResponsiveContainer(
            height: 52,
            width: double.infinity,
            padding: [12, 12, 12, 12],
            decoration: BoxDecoration(
              color: const Color(0xFFFFC107),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child:
                  isLoading
                      ? const CircularProgressIndicator(
                        color: Color.fromRGBO(53, 50, 43, 1),
                        strokeWidth: 2.0,
                      )
                      : const ResponsiveText(
                        'Register Device',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(53, 50, 43, 1),
                        ),
                      ),
            ),
          ),
        );
      },
    );
  }
}
