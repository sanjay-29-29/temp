import 'dart:typed_data';

import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_postioned.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';

class FrameLogin extends StatelessWidget {
  final String gridImagePath;
  final String? frameImagePath;
  final double frameHeightFactor;
  final String? name;
  final String? role;
  final String? department;
  final String? topic;
  final String? phoneNo;
  final Map<dynamic, dynamic>? image;

  const FrameLogin({
    super.key,
    required this.gridImagePath,
    this.frameImagePath,
    this.frameHeightFactor = 0.48,
    this.name,
    this.role,
    this.department,
    this.image,
    this.phoneNo,
    this.topic,
  });

  @override
  Widget build(BuildContext context) {
    final imageWidget = _buildImageWidget();

    return ResponsiveContainer(
      width: double.infinity,
      height: 447,
      color: AppColors.backgroundColor,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              gridImagePath,
              fit: BoxFit.cover,
            ),
          ),
          if (frameImagePath != null)
            ResponsivePositioned(
              top: 394,
              left: 19,
              child: ResponsiveText(
                'Plumbing redefined...',
                style: StyleConstants.customStyle(
                  24,
                  AppColors.buttonColor,
                  FontWeight.w500,
                ),
              ),
            ),
          if (frameImagePath != null)
            Positioned.fill(
              child: Image.asset(
                frameImagePath!,
                fit: BoxFit.cover,
              ),
            ),
          if (name != null && role != null && department != null)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ResponsiveText(
                    topic ?? 'WELCOME BACK!',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: StyleConstants.customStyle(
                      12,
                      AppColors.lightBlue,
                      FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.buttonColor,
                        width: 2,
                      ),
                    ),
                    child: imageWidget,
                  ),
                  const SizedBox(height: 10),
                  ResponsiveText(
                    name!,
                    style: StyleConstants.customStyle(
                      24,
                      AppColors.buttonColor,
                      FontWeight.w500,
                    ),
                  ),
                  const ResponsiveSizedBox(height: 4, width: 0),
                  ResponsiveText(
                    '$role, $department',
                    style: StyleConstants.customStyle(
                        16, AppColors.lightBlue, FontWeight.w600),
                  ),
                  const ResponsiveSizedBox(height: 4, width: 0),
                  ResponsiveText(
                    '+91 $phoneNo',
                    style: StyleConstants.customStyle(
                        16, AppColors.lightBlue, FontWeight.w600),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImageWidget() {
    if (image == null) {
      return const CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage(AssetConstants.profileImage),
      );
    }

    try {
      final Uint8List bytes =
          Uint8List.fromList(List<int>.from(image!['data']));

      return CircleAvatar(
        radius: 60,
        backgroundImage: MemoryImage(bytes),
      );
    } catch (e) {
      return const CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage(AssetConstants.profileImage),
      );
    }
  }
}
