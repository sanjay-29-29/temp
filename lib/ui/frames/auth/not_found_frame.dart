import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';

class AddErrorFrame extends StatelessWidget {
  final String image;
  const AddErrorFrame({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 414,
      height: 443,
      color: AppColors.backgroundColor,
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
