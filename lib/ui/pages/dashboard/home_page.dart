import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/department_constants.dart';
import 'package:BuildTek/constants/role_constants.dart';
import 'package:BuildTek/ui/widgets/dashboard/logo_notification.dart';
import 'package:BuildTek/ui/widgets/dashboard/name.dart';
import 'package:BuildTek/ui/widgets/dashboard/view_states.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final UserDepartment department;
  final UserRole role;

  const HomePage({required this.department, required this.role, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSwipedUp = false;
  late String department, role;

  @override
  void initState() {
    super.initState();
    department = widget.department.name;
    role = widget.role.name;
  }

  // void _toggleSwipe() {
  //   setState(() {
  //     _isSwipedUp = !_isSwipedUp;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!_isSwipedUp)
                  ResponsiveContainer(
                    width: 414,
                    // height: 398,
                    height: 270,
                    child: Column(
                      children: [
                        const ResponsiveSizedBox(width: 0, height: 32),
                        TopNavBar(
                          role: role,
                          department: department,
                        ),
                        const ResponsiveSizedBox(width: 0, height: 20),
                        const ResponsiveContainer(
                          width: 414,
                          // height: 267.02,
                          height: 170,
                          padding: [24, 0, 24, 0],
                          child: Column(
                            children: [
                              NameWidget(),
                              ResponsiveSizedBox(width: 0, height: 20),
                              ViewStatsWidget(),
                              ResponsiveSizedBox(width: 0, height: 8),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColors.dividerColor,
                              ),
                              ResponsiveSizedBox(width: 0, height: 10),
                              // ReportsPageView(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                else
                  ResponsiveContainer(
                    width: 414,
                    height: 160,
                    child: Column(
                      children: [
                        const ResponsiveSizedBox(width: 0, height: 32),
                        TopNavBar(
                          role: role,
                          department: department,
                        ),
                        const ResponsiveSizedBox(width: 0, height: 20),
                        const ResponsiveContainer(
                          width: 366,
                          height: 44,
                          child: ViewStatsWidget(),
                        ),
                      ],
                    ),
                  ),
                // Expanded(
                //   child: SwipeViewWidget(
                //     role: role,
                //     department: department,
                //     isSwipedUp: _isSwipedUp,
                //     onSwipeToggle: _toggleSwipe,
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
