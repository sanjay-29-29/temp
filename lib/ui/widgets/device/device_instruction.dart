import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';

import '../../wrapper_class/responseive_container.dart';

class DeviceInstruction extends StatefulWidget {
  const DeviceInstruction({super.key});

  @override
  State<DeviceInstruction> createState() => _DeviceInstructionState();
}

class _DeviceInstructionState extends State<DeviceInstruction> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveContainer(
      width: 366,
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ResponsiveContainer(
            width: 366,
            height: 88,
            child: ResponsiveText(
              'Register Your Device',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(11, 11, 11, 1),
                height: 1,
              ),
            ),
          ),
          ResponsiveText(
            'Please confirm your device details to make it the primary business number:',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(131, 131, 131, 1),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          ResponsiveContainer(
            width: 366,
            height: 78,
            padding: [10, 0, 0, 0],
            child: ResponsiveText(
              '• Helps to provide right support\n'
              '• Keep your business details separate\n'
              '• One more reason can go here',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(131, 131, 131, 1),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
