import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const route = '/';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("hello word"));
  }
}
