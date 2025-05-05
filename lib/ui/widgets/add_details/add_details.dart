import 'package:BuildTek/constants/style_constants.dart';
import 'package:BuildTek/ui/widgets/add_details/button_config.dart';
import 'package:BuildTek/ui/widgets/add_details/employee_details.dart';
import 'package:BuildTek/ui/widgets/add_details/personal_details.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';

class AddDetailsEmployee extends StatelessWidget {
  final List<ButtonConfig> buttonConfigs;

  const AddDetailsEmployee({super.key, required this.buttonConfigs});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          IntrinsicHeight(
            child: Container(
              width: 366,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveContainer(
                    width: 334,
                    height: 96,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveText(
                          'Add details',
                          style: StyleConstants.customStyle(
                            36,
                            Colors.white,
                            FontWeight.w500,
                          ),
                        ),
                        ResponsiveText(
                          'You can add your expenses or even add a new customer',
                          style: StyleConstants.customStyle(
                            14,
                            Colors.grey,
                            FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveSizedBox(width: 0, height: 32),
                  for (var button in buttonConfigs)
                    Column(
                      children: [
                        button.isGreen
                            ? GreenActionButton(
                              imagePath: button.imagePath,
                              label: button.label,
                              onPressed: button.onPressed,
                            )
                            : PersonalDetails(
                              imagePath: button.imagePath,
                              label: button.label,
                              onPressed: button.onPressed,
                            ),
                        const ResponsiveSizedBox(width: 0, height: 12),
                      ],
                    ),
                  const ResponsiveSizedBox(width: 0, height: 20),
                  Center(
                    child: TextButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.white),
                      label: const Text(
                        'CLOSE',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
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
