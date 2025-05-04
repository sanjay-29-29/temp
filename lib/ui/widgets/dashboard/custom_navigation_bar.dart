import 'package:BuildTek/constants/department_constants.dart';
import 'package:BuildTek/constants/role_constants.dart';
import 'package:BuildTek/models/route/navigation_item.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final UserDepartment department;
  final UserRole role;
  final Function(int) onTabSelected;
  final int currentIndex;
  final List<NavigationItem> navItems;

  const CustomNavigationBar({
    super.key,
    required this.department,
    required this.role,
    required this.onTabSelected,
    required this.currentIndex,
    required this.navItems,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
