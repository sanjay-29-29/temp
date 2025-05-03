import 'package:buildtek_ui/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        debugShowMaterialGrid: true,
        title: "BuildTek Leadflow",
        routerConfig: AppRouter.router,
      ),
    );
  }
}
