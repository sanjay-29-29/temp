
import 'package:BuildTek/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CircleLoadingWidget extends StatelessWidget {
  final Color? bgColor;
  final Color? loadingColor;
  const CircleLoadingWidget({super.key, this.bgColor, this.loadingColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414,
      // ignore: deprecated_member_use
      color: bgColor ?? AppColors.loadingBackgroundColor.withOpacity(0.5),
      child: Align(
        alignment: Alignment.center,
        // child: Center(
        //   child: CircularProgressIndicator(
        //     valueColor: AlwaysStoppedAnimation<Color>(
        //       isColor != null
        //           ? StyleConstants.backgroundColor
        //           : StyleConstants.backgroundColor,
        //     ),
        //   ),
        // ),
        child: LoadingAnimationWidget.threeArchedCircle(
          color: loadingColor ?? AppColors.backgroundColor,
          size: 50,
        ),
      ),
    );
  }
}
