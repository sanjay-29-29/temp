import 'package:BuildTek/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class CloseField extends StatelessWidget {
  final VoidCallback onClose;

  const CloseField({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          AssetConstants.closeBoxIcon,
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
