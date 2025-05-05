import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 32,
      height: 32,
      padding: const [4.3, 4.3, 4.3, 4.3],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.buttonColor,
      ),
      child: Image.asset(AssetConstants.logoIcon, width: 16, height: 18),
    );
  }
}
