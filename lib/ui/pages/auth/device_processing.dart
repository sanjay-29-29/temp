import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/frames/auth/device_frame.dart';
import 'package:BuildTek/ui/layout/auth/device_layout.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeviceProcessingPage extends StatelessWidget {
  static const String route = '/deviceProcessing';

  const DeviceProcessingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceLayout(
      header: DeviceFrame(
        isFrame1: false,
      ),
      content: DeviceContent(),
    );
  }
}

class DeviceContent extends StatelessWidget {
  const DeviceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveContainer(
      width: 366,
      height: 550,
      padding: [24, 15, 12, 0],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DeviceProcessingWidget(),
          DeviceLogOutButton(),
        ],
      ),
    );
  }
}

class DeviceProcessingWidget extends StatelessWidget {
  const DeviceProcessingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 366,
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveText(
            'Processing',
            style: StyleConstants.customStyle(
              44,
              Color.fromRGBO(11, 11, 11, 1),
              FontWeight.w500,
            ),
          ),
          ResponsiveText(
            'Our team is granting you access. The process will be done within 24 hours.',
            style: StyleConstants.customStyle(
              16,
              Color.fromRGBO(131, 131, 131, 1),
              FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceLogOutButton extends StatelessWidget {
  const DeviceLogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/login');
      },
      child: ResponsiveContainer(
        width: 342,
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.itemSelectedColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: ResponsiveText(
            'Log Out',
            style: StyleConstants.formButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
