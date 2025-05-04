import 'package:flutter/material.dart';

class DeviceLayout extends StatelessWidget {
  final Widget header;
  final Widget content;

  const DeviceLayout({
    super.key,
    required this.header,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 244, 249, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            header,
            content,
          ],
        ),
      ),
    );
  }
}
