import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/devices/fetch_device_model.dart';
import 'package:BuildTek/ui/frames/auth/device_frame.dart';
import 'package:BuildTek/ui/layout/auth/device_layout.dart';
import 'package:flutter/material.dart';

import '../../widgets/device/device_details.dart';
import '../../widgets/device/device_instruction.dart';

class AddDevicePage extends StatefulWidget {
  static const String route = '/addDevice';

  final FetchDeviceModel device;
  final Employee employee;

  const AddDevicePage({
    required this.device,
    required this.employee,
    super.key,
  });

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Positioned.fill(
            child: DeviceLayout(
              header: const DeviceFrame(
                isFrame1: true,
              ),
              content: Padding(
                padding: const EdgeInsets.fromLTRB(24, 15, 24, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DeviceInstruction(),
                    DeviceDetailsSection(
                      device: widget.device,
                      employee: widget.employee,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
