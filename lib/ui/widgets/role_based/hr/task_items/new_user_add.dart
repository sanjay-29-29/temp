import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/models/user_based_models/hr/unverified_employee.dart';
import 'package:BuildTek/ui/widgets/dialog/activate_device.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewUserAdded extends StatefulWidget {
  final EmployeeModelUnVerified employee;

  const NewUserAdded({super.key, required this.employee});

  @override
  State<NewUserAdded> createState() => _NewUserAddedState();
}

class _NewUserAddedState extends State<NewUserAdded> {
  bool showDeviceActivation = false;
  late EmployeeModelUnVerified employee;
  @override
  void initState() {
    super.initState();
    employee = widget.employee;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 366,
      height: 120,
      padding: const [12, 12, 12, 12],
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveContainer(
            width: 24,
            height: 24,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFFB1EBFF),
              child: Image.asset(
                AssetConstants.addEmployeeIcon,
                width: 13.33,
                height: 12.67,
              ),
            ),
          ),
          const ResponsiveSizedBox(width: 8, height: 0),
          Expanded(
            child: ResponsiveContainer(
              width: 310,
              height: 94,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveContainer(
                    width: 310,
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveText(
                          'New User Added',
                          style: StyleConstants.customStyle(
                            12,
                            Colors.black,
                            FontWeight.w500,
                          ),
                        ),
                        const ResponsiveSizedBox(width: 0, height: 4),
                        ResponsiveText(
                          '${employee.firstName} ${employee.lastName}',
                          style: StyleConstants.customStyle(
                            16,
                            Colors.black,
                            FontWeight.w600,
                          ),
                        ),
                        const ResponsiveSizedBox(width: 0, height: 4),
                        Row(
                          children: [
                            ResponsiveText(
                              employee.role.roleName,
                              style: StyleConstants.customStyle(
                                12,
                                Color(0xFF172B4D),
                                FontWeight.w500,
                              ),
                            ),
                            const ResponsiveSizedBox(width: 4, height: 0),
                            ResponsiveText(
                              employee.department.name,
                              style: StyleConstants.customStyle(
                                12,
                                Color(0xFF172B4D),
                                FontWeight.w500,
                              ),
                            ),
                            const ResponsiveSizedBox(width: 4, height: 0),
                            ResponsiveText(
                              employee.books.isNotEmpty
                                  ? (employee.books.length > 1
                                      ? '${employee.books[0].name} +${employee.books.length - 1}'
                                      : employee.books[0].name)
                                  : '',
                              style: StyleConstants.customStyle(
                                12,
                                Color(0xFF172B4D),
                                FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveSizedBox(width: 0, height: 8),
                  const Divider(color: Color(0xFFCCCCCC), height: 1),
                  const ResponsiveSizedBox(width: 0, height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconWithLabel(
                        iconPath: AssetConstants.locationIcon,
                        label: 'Location',
                        textColor: const Color(0xFF9E9E9E),
                        onChanged: () {},
                      ),
                      _buildIconWithLabel(
                        iconPath: AssetConstants.verifiedIcon,
                        label: 'Activate device',
                        textColor: const Color.fromRGBO(23, 43, 77, 1),
                        onChanged:
                            () => _showDeviceActivationPopup(
                              context,
                              employee.devices,
                              employee.id,
                            ),
                      ),
                      _buildIconWithLabel(
                        iconPath: AssetConstants.detailsIcon,
                        label: 'Details',
                        textColor: const Color.fromRGBO(23, 43, 77, 1),
                        onChanged: () {
                          context.replace(
                            '/home/profile',
                            extra: {'id': widget.employee.id},
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeviceActivationPopup(
    BuildContext context,
    List<EmpDeviceModelUnVerififed> devices,
    String employeeId,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ActivateDeviceDialog(
          devices: devices,
          employeeId: employeeId,
          onActivateDevice: (EmpDeviceModelUnVerififed device, String employeeId) {},
        );
      },
    );
  }

  Widget _buildIconWithLabel({
    required String iconPath,
    required String label,
    required Color textColor,
    required Function() onChanged,
  }) {
    return GestureDetector(
      onTap: onChanged,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveContainer(
            width: 20,
            height: 20,
            child: Center(
              child: Image.asset(
                iconPath,
                color: textColor,
                width: 16,
                height: 16,
              ),
            ),
          ),
          const ResponsiveSizedBox(width: 4, height: 0),
          ResponsiveText(
            label,
            style: StyleConstants.customStyle(12, textColor, FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
