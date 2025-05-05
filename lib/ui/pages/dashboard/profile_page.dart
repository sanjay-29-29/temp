import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String id;
  const ProfilePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: Center(child: const Text('Profile Page Content')),
    );
  }
}
