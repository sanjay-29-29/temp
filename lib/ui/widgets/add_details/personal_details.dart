import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const PersonalDetails({
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
      padding: const [12, 8, 12, 8],
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
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
              color: Color.fromRGBO(53, 50, 43, 1)
            ),
            RichText(
              text: TextSpan(
                text: 'Add ',
                style: StyleConstants.addDetailsWhiteTextStyle,
                children: [
                  TextSpan(
                      text: ' ${label.split(' ').sublist(1).join(' ')}',
                      style: StyleConstants.addDetailsWhiteTextStyle),
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
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
