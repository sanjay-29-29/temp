import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';

class GreenActionButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const GreenActionButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 334,
      height: 56,
      padding: [12, 8, 12, 8],
      decoration: BoxDecoration(
        color: AppColors.buttonBorderColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.greenButtonColor),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 24,
              height: 24,
            ),
            RichText(
              text: TextSpan(
                text: 'Add ',
                style: StyleConstants.addDetailsTextStyle,
                children: [
                  TextSpan(
                    text: ' ${label.split(' ').sublist(1).join(' ')}',
                    style: StyleConstants.addDetailsTextStyle,
                  ),
                ],
              ),
            ),
            ResponsiveContainer(
              width: 24,
              height: 24,
              child: Center(
                child: Image.asset(
                  AssetConstants.greaterThanIcon,
                  width: 8.5,
                  height: 15.5,
                  color: const Color.fromRGBO(130, 235, 81, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
