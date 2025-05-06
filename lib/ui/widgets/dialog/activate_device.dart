import 'package:BuildTek/bloc/dashboard/hr_bloc/verify_employee/verify_employee_bloc.dart';
import 'package:BuildTek/bloc/dashboard/hr_bloc/verify_employee/verify_employee_event.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/models/devices/add_device_model.dart';
import 'package:BuildTek/models/user_based_models/hr/unverified_employee.dart';
import 'package:BuildTek/ui/widgets/common/close_field.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ActivateDeviceDialog extends StatelessWidget {
  final List<EmpDeviceModelUnVerififed> devices;
  final String employeeId;
  final Function(EmpDeviceModelUnVerififed device, String employeeId) onActivateDevice;

  const ActivateDeviceDialog({
    super.key,
    required this.devices,
    required this.employeeId,
    required this.onActivateDevice,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CloseField(onClose: context.pop),
          const ResponsiveSizedBox(width: 0, height: 12),
          ResponsiveContainer(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(6, 4, 35, 1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResponsiveSizedBox(width: 0, height: 10),
                ResponsiveText(
                  'Activate Devices',
                  style: StyleConstants.customStyle(
                    32,
                    Colors.white,
                    FontWeight.w600,
                  ),
                ),
                const ResponsiveSizedBox(width: 0, height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: devices.length,
                    itemBuilder: (context, index) {
                      final device = devices[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ResponsiveText(
                              '${device.deviceMake} - ${device.deviceModel}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                final deviceId = device.deviceId;
                                DeviceActivateModel deviceActivate =
                                    DeviceActivateModel(
                                      deviceId: deviceId,
                                      employee: employeeId,
                                    );
                                context.read<VerifyEmployeeBloc>().add(
                                  ActivateDeviceEvent(
                                    deviceActivate: deviceActivate,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const ResponsiveSizedBox(width: 0, height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
