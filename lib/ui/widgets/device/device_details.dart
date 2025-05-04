import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/models/devices/fetch_device_model.dart';
import 'package:flutter/material.dart';

import '../../wrapper_class/responseive_container.dart';
import '../../wrapper_class/responsive_text.dart';

class DeviceDetailsSection extends StatefulWidget {
  final FetchDevice device;
  final Employee employee;
  const DeviceDetailsSection({
    super.key,
    required this.device,
    required this.employee,
  });

  @override
  DeviceDetailsSectionState createState() => DeviceDetailsSectionState();
}

class DeviceDetailsSectionState extends State<DeviceDetailsSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDeviceDetails(context, widget.device, widget.employee);
  }

  Widget _buildDeviceDetails(
      BuildContext context, FetchDevice device, Employee employee) {
    return ResponsiveContainer(
      width: 366,
      height: 282,
      padding: [12, 12, 12, 12],
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ResponsiveText(
            'DEVICE DETAILS',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              fontSize: 12,
              color: Color.fromRGBO(138, 138, 138, 1),
            ),
          ),
          ResponsiveContainer(
            width: 342,
            height: 143,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabelValue('Make', device.deviceMake),
                _buildLabelValue('Model', device.deviceModel),
                _buildLabelValue('PhoneNo', employee.phoneNo),
              ],
            ),
          ),
          // DeviceDetailsButton(device: device, employee: employee),
        ],
      ),
    );
  }

  Widget _buildLabelValue(String label, String value) {
    return ResponsiveContainer(
      width: 342,
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveText(
            '$label:',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(131, 131, 131, 1),
              fontFamily: 'Inter',
              height: 0.2,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintText: value,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 16,
                height: 1,
              ),
            ),
            enabled: false,
          ),
        ],
      ),
    );
  }
}
