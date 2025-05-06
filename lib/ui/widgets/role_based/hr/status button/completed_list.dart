import 'package:BuildTek/ui/wrapper_class/responsive_text.dart';
import 'package:flutter/material.dart';

class HrCompleteLeadsView extends StatefulWidget {
  const HrCompleteLeadsView({super.key});

  @override
  State<HrCompleteLeadsView> createState() => _HrCompleteLeadsViewState();
}

class _HrCompleteLeadsViewState extends State<HrCompleteLeadsView> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> leadItemsList = [
      // const ApproveInvoice(
      //   username: 'Casa Grande',
      //   coldlead: true,
      //   commentCount: 4,
      // ),
      // const ApproveInvoice(
      //   username: 'Casa Grande',
      //   coldlead: false,
      //   commentCount: 10,
      // ),
      const SizedBox(height: 70, width: double.infinity),
      const Center(
        child: ResponsiveText(
          'Under Working',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      const SizedBox(height: 70, width: double.infinity),
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      itemBuilder: (context, index) {
        return leadItemsList[index];
      },
      separatorBuilder: (context, index) {
        if (index == leadItemsList.length - 1) {
          return const SizedBox(height: 50.0);
        }
        return const SizedBox(height: 10.0);
      },
      itemCount: leadItemsList.length,
    );
  }
}
