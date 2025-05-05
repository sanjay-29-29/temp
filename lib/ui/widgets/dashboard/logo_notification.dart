import 'package:BuildTek/config/toastication_config.dart';
import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/services/storage/store_service.dart';
import 'package:BuildTek/ui/widgets/dashboard/components/location_display.dart';
import 'package:BuildTek/ui/widgets/dashboard/components/logo_container.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopNavBar extends StatefulWidget {
  final String department;
  final String role;
  const TopNavBar({required this.department, required this.role, super.key});

  @override
  State<TopNavBar> createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  late String department;
  late String role;
  @override
  void initState() {
    super.initState();
    department = widget.department;
    role = widget.role;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 414,
      height: 48,
      padding: const [16, 8, 16, 8],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LogoContainer(),
          const ResponsiveSizedBox(width: 4, height: 0),
          if (department != 'HR' && role != 'SUPER ADMIN')
            const LocationDisplayWidget(),
          const Spacer(),
          NotificationButton(count: 10),
          // NewButton(department: department),
          const ResponsiveSizedBox(width: 4, height: 0),
          // const Notification(),
          const LogoutButton(),
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      await StoreService.deleteAllData();
      toaster.showInfo(title: 'Successfully Logged Out');
      // ignore: use_build_context_synchronously
      context.go('/login');
    } catch (error) {
      toaster.showError(title: '$error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _logout(context),
      child: ResponsiveContainer(
        width: 38,
        height: 48,
        child: ElevatedButton(
          onPressed: () => _logout(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.all(2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Icon(Icons.logout, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  final int count;
  const NotificationButton({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 90,
      height: 32,
      padding: const [8, 4, 8, 4],
      decoration: BoxDecoration(
        color: AppColors.notificationBackgroundColor,
        borderRadius: BorderRadius.circular(99),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetConstants.bellRingIcon, width: 24, height: 24),
            ResponsiveContainer(
              width: 26,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.notificationCountBackgroundColor,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Center(
                child: ResponsiveText(
                  count > 9 ? '9+' : count.toString(),
                  style: StyleConstants.notificationTextStyle,
                ),
              ),
            ),
            ResponsiveContainer(
              width: 16,
              height: 16,
              // padding: const [2,2,2,2],
              child: Image.asset(AssetConstants.downArrowIcon),
            ),
          ],
        ),
      ),
    );
  }
}

// class Notification extends StatelessWidget {
//   const Notification({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CircleAvatar(
//       backgroundColor: Colors.black,
//       radius: 20,
//       child: Icon(
//         Feather.bell,
//         color: Colors.white,
//         size: 24,
//       ),
//     );
//   }
// }
