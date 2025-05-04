import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';

class DeviceFrame extends StatelessWidget {
  final bool isFrame1;
  const DeviceFrame({required this.isFrame1, super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 414,
      height: 306,
      color: const Color(0xFF023E8A),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AssetConstants.gridImage,
              fit: BoxFit.cover,
            ),
          ),
          if (isFrame1)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AssetConstants.phoneImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
