import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/department_constants.dart';
import 'package:BuildTek/ui/widgets/add_details/add_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddDetailsEmployeeWrapper extends StatelessWidget {
  final List<ButtonConfig> buttonConfigs;

  const AddDetailsEmployeeWrapper({super.key, required this.buttonConfigs});

  @override
  Widget build(BuildContext context) {
    return AddDetailsEmployee(buttonConfigs: buttonConfigs);
  }
}

class ButtonConfig {
  final String imagePath;
  final String label;
  final bool isGreen;
  final VoidCallback onPressed;

  ButtonConfig({
    required this.imagePath,
    required this.label,
    required this.isGreen,
    required this.onPressed,
  });
}

Widget buildHRDialog(BuildContext context) {
  return AddDetailsEmployeeWrapper(
    buttonConfigs: [
      ButtonConfig(
        imagePath: AssetConstants.taskIcon,
        label: 'Add New Task',
        isGreen: true,
        onPressed: () {
          context.replace('/home/add-task');
        },
      ),
      ButtonConfig(
        imagePath: AssetConstants.customerIcon,
        label: 'Add New Employee',
        isGreen: false,
        onPressed: () {
          Navigator.of(context).pop();
          context.go('/home/add-employee');
        },
      ),
    ],
  );
}

Widget buildMarketingDialog(BuildContext context) {
  return AddDetailsEmployeeWrapper(
    buttonConfigs: [
      ButtonConfig(
        imagePath: AssetConstants.taskIcon,
        label: 'Add New Task',
        isGreen: true,
        onPressed: () {
          context.go('/home/addTask');
        },
      ),
      ButtonConfig(
        imagePath: AssetConstants.customerIcon,
        label: 'Add New Project',
        isGreen: false,
        onPressed: () {
          Navigator.of(context).pop();
          context.push('/home/customer/add-newProject');
        },
      ),
      ButtonConfig(
        imagePath: AssetConstants.customerIcon,
        label: 'Add New Intent',
        isGreen: false,
        onPressed: () {
          Navigator.of(context).pop();
          context.go('/home/customer');
        },
      ),
    ],
  );
}

Widget buildAdminDialog(BuildContext context) {
  return AddDetailsEmployeeWrapper(
    buttonConfigs: [
      ButtonConfig(
        imagePath: AssetConstants.taskIcon,
        label: 'Add New Task',
        isGreen: true,
        onPressed: () {
          context.go('/admin/add-task');
        },
      ),
      ButtonConfig(
        imagePath: AssetConstants.customerIcon,
        label: 'Add New Admin',
        isGreen: false,
        onPressed: () {
          context.go('/admin/add-admin');
        },
      ),
      ButtonConfig(
        imagePath: AssetConstants.customerIcon,
        label: 'Add New Intent',
        isGreen: false,
        onPressed: () {
          Navigator.of(context).pop();
          context.go('/home/customer');
        },
      ),
      ButtonConfig(
        imagePath: AssetConstants.customerIcon,
        label: 'Add New Employee',
        isGreen: false,
        onPressed: () {
          Navigator.of(context).pop();
          context.go('/home/add-employee');
        },
      ),
    ],
  );
}

Widget buildFinanceDialog(BuildContext context) {
  return AddDetailsEmployeeWrapper(
    buttonConfigs: [
      ButtonConfig(
        imagePath: AssetConstants.taskIcon,
        label: 'Add New Task',
        isGreen: false,
        onPressed: () {
          context.go('/marketing/addTask');
        },
      ),
      ButtonConfig(
        imagePath: AssetConstants.customerIcon,
        label: 'Add New Customer',
        isGreen: true,
        onPressed: () {
          context.go('/marketing/customer');
        },
      ),
    ],
  );
}

Widget buildAccountsDialog(BuildContext context) {
  return AddDetailsEmployeeWrapper(
    buttonConfigs: [
      ButtonConfig(
        imagePath: AssetConstants.taskIcon,
        label: 'Add New Task',
        isGreen: false,
        onPressed: () {
          context.go('/accounts/add-task');
        },
      ),
      ButtonConfig(
        imagePath: AssetConstants.customerIcon,
        label: 'Add New Account',
        isGreen: true,
        onPressed: () {
          context.go('/accounts/add-account');
        },
      ),
    ],
  );
}

Widget buildAddDetailsDialog(BuildContext context, UserDepartment department) {
  switch (department) {
    case UserDepartment.HR:
      return buildHRDialog(context);
    case UserDepartment.Marketing:
    case UserDepartment.Sales:
    case UserDepartment.Branding:
      return buildMarketingDialog(context);
    case UserDepartment.Admin:
      return buildAdminDialog(context);
    case UserDepartment.Finance:
      return buildFinanceDialog(context);
    case UserDepartment.Accounts:
      return buildAccountsDialog(context);
    default:
      return Container();
  }
}
