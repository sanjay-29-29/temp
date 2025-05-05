import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/department_constants.dart';
import 'package:BuildTek/constants/role_constants.dart';
import 'package:BuildTek/models/constants/common_navbar_model.dart';
import 'package:BuildTek/ui/widgets/add_details/button_config.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  final UserDepartment department;
  final UserRole role;
  final Function(int) onTabSelected;
  final int currentIndex;
  final List<NavigationItemModel> navItems;

  const CustomBottomNavigationBar({
    super.key,
    required this.department,
    required this.role,
    required this.onTabSelected,
    required this.currentIndex,
    required this.navItems,
  });

  void _onAddButtonPressed(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      // ignore: deprecated_member_use
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation1, animation2) {
      return buildAddDetailsDialog(context, department);
      },
      transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
        ).animate(animation1),
        child: child,
      );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 366,
      height: 66,
      padding: const [24, 0, 24, 0],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveContainer(
            width: 294,
            height: 56,
            padding: const [20, 0, 20, 0],
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(99),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 3.0,
                ),
              ],
              border: Border.all(
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: navItems.map((item) {
                return _buildNavItem(
                  iconPath: item.iconPath,
                  label: item.label,
                  index: item.index,
                  isSelected: currentIndex == item.index,
                  onTap: () => onTabSelected(item.index),
                );
              }).toList(),
            ),
          ),
          const ResponsiveSizedBox(width: 10, height: 0),
          ResponsiveContainer(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(11, 11, 11, 1),
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
                onTap: () {
                  _onAddButtonPressed(context);
                },
                child: Image.asset(
                  AssetConstants.plusIcon,
                  color: Colors.white,
                  height: 24,
                  width: 24,
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isSelected)
            Container(
              width: 24,
              height: 2,
              margin: const EdgeInsets.only(bottom: 6),
              color: const Color.fromRGBO(2, 62, 128, 1),
            )
          else
            const ResponsiveSizedBox(width: 0, height: 2),
          Image.asset(
            iconPath,
            color:
                isSelected ? const Color.fromRGBO(2, 62, 128, 1) : Colors.black,
            width: 26,
            height: 26,
          ),
          if (isSelected)
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? const Color.fromRGBO(2, 62, 128, 1)
                    : Colors.black,
                fontSize: 10,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }
}
