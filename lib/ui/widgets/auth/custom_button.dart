import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isEnabled;
  final double? width;
  final double? height;
  final bool? arrowNeeded;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.label,
    this.backgroundColor,
    this.textColor,
    required this.isEnabled,
    this.width,
    this.height,
    this.arrowNeeded = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled == true ? onPressed : null,
      child: ResponsiveContainer(
        width: width ?? 366,
        height: height ?? 48,
        decoration: BoxDecoration(
          color:
              isEnabled ? AppColors.buttonColor : AppColors.disabledButtonColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveText(
                label,
                style: StyleConstants.buttonStyle,
              ),
              if (arrowNeeded == true) ...[
                ResponsiveSizedBox(width: 8, height: 0),
                ResponsiveContainer(
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Image.asset(
                      AssetConstants.rightArrowIcon,
                      width: 20,
                      height: 20,
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
