import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HrAddUser extends StatefulWidget {
  final int count;
  const HrAddUser({super.key, required this.count});

  @override
  State<HrAddUser> createState() => _HrAddUserState();
}

class _HrAddUserState extends State<HrAddUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      height: 98,
      width: 366,
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
              backgroundColor: const Color.fromRGBO(255, 219, 187, 1),
              child: Image.asset(
                AssetConstants.plusIcon,
                width: 13.33,
                height: 12.67,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ResponsiveContainer(
              width: 310,
              height: 74,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveContainer(
                    width: 310,
                    height: 37,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveText(
                          'Add users',
                          style: StyleConstants.customStyle(
                            12,
                            Colors.black,
                            FontWeight.w500,
                          ),
                        ),
                        const ResponsiveSizedBox(width: 0, height: 2),
                        ResponsiveText(
                          '${widget.count} new joinees',
                          style: StyleConstants.customStyle(
                            16,
                            Colors.black,
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveSizedBox(width: 0, height: 6),
                  const Divider(color: Color(0xFFCCCCCC), height: 1),
                  const ResponsiveSizedBox(width: 0, height: 6),
                  ResponsiveContainer(
                    width: 310,
                    height: 20,
                    child: GestureDetector(
                      onTap: () => context.replace('/add/employee'),
                      child: ResponsiveContainer(
                        width: 90,
                        height: 20,
                        // padding:const [8,8,8,8],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetConstants.plusIcon1,
                              width: 16,
                              height: 16,
                            ),
                            ResponsiveText(
                              'Add People',
                              style: StyleConstants.customStyle(
                                12,
                                Color.fromRGBO(92, 91, 88, 1),
                                FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
