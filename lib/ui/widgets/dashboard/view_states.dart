import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';

class ViewStatsWidget extends StatefulWidget {
  const ViewStatsWidget({super.key});

  @override
  State<ViewStatsWidget> createState() => _ViewStatsWidgetState();
}

class _ViewStatsWidgetState extends State<ViewStatsWidget> {
  @override
  Widget build(BuildContext context) {
    double progressReport = 0.8 * 100;

    return ResponsiveContainer(
      width: 366,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ResponsiveContainer(
            width: 200,
            height: 44,
            child: ResponsiveText(
              "Completed $progressReport% of your tasks yesterday",
              style: StyleConstants.customStyle(
                18,
                Color(0xFFEEC800),
                FontWeight.w500,
              ),
            ),
          ),
          const ViewStatsButton(),
        ],
      ),
    );
  }
}

class ViewStatsButton extends StatelessWidget {
  const ViewStatsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 124,
      height: 44,
      child: TextButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveText(
              "VIEW STATS",
              style: StyleConstants.customStyle(
                12,
                Colors.white,
                FontWeight.w500,
              ),
            ),
            Image.asset(
              AssetConstants.rightArrowIcon,
              color: Colors.white,
              width: 20.75,
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
