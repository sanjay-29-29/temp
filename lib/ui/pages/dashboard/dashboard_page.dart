import 'package:BuildTek/bloc/dashboard/role_department/role_department_bloc.dart';
import 'package:BuildTek/bloc/dashboard/role_department/role_department_consumer.dart';
import 'package:BuildTek/bloc/dashboard/role_department/role_department_event.dart';
import 'package:BuildTek/bloc/dashboard/role_department/role_department_state.dart';
import 'package:BuildTek/constants/department_constants.dart';
import 'package:BuildTek/constants/role_constants.dart';
import 'package:BuildTek/models/constants/common_navbar_model.dart';
import 'package:BuildTek/ui/pages/dashboard/home_page.dart';
import 'package:BuildTek/ui/pages/dashboard/profile_page.dart';
import 'package:BuildTek/ui/pages/dashboard/search_page.dart';
import 'package:BuildTek/ui/widgets/common/custom_bottoom_navbar.dart';
import 'package:BuildTek/ui/widgets/common/loading.dart';
import 'package:BuildTek/ui/widgets/common/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  static const route = '/home';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<RoleDepartmentBloc>().add(FetchRoleDepartment());
  }

  List<NavigationItemModel> _getNavItems(
    UserDepartment department,
    UserRole role,
  ) {
    return navItems[department]?[role] ?? [];
  }

  Widget _getCurrentPage(UserDepartment department, UserRole role, String id) {
    switch (_currentIndex) {
      case 0:
        return HomePage(department: department, role: role);
      case 1:
        if (department == UserDepartment.HR) {
          // return SearchPeople();
          return SearchPage();
        } else if (department == UserDepartment.Marketing ||
            department == UserDepartment.Sales ||
            department == UserDepartment.Branding) {
          // return SearchMarketing(role: role, department: department);
          return SearchPage();
        } else if (department == UserDepartment.Admin) {
          // return SearchPeople();
          return SearchPage();
        } else if (department == UserDepartment.Finance ||
            department == UserDepartment.Accounts) {
          return const CircleLoadingWidget();
        } else {
          return const CircleLoadingWidget();
        }
      case 2:
        return ProfilePage(id: id);
      case 3:
        return const CircleLoadingWidget();
      default:
        return const CircleLoadingWidget();
    }
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RoleDepartmentConsumer(
      builder: (context, state) {
        if (state is RoleDepartmentLoaded) {
          return Material(
            color: const Color(0xFF023e8A),
            child: Stack(
              children: [
                Positioned.fill(
                  child: _getCurrentPage(
                    state.department,
                    state.role,
                    state.id,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: CustomBottomNavigationBar(
                    department: state.department,
                    role: state.role,
                    currentIndex: _currentIndex,
                    navItems: _getNavItems(state.department, state.role),
                    onTabSelected: _onTabSelected,
                  ),
                ),
              ],
            ),
          );
        } else if (state is RoleDepartmentError) {
          return Center(child: Text(state.message));
        } else {
          return const CircleLoadingWidget();
        }
      },
    );
  }
}
