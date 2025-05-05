import 'package:BuildTek/bloc/auth/authenticate/authenicate_bloc.dart';
import 'package:BuildTek/bloc/auth/authenticate/authenticate_event.dart';
import 'package:BuildTek/config/app_providers.dart';
import 'package:BuildTek/config/toastication_config.dart';
import 'package:BuildTek/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc()..add(LoginEvent()),
        ),
        ...AppProviders.repositoryProvider,
      ],
      child: MultiBlocProvider(
        providers: AppProviders.blocProviders,
        child: Builder(
          builder: (context) {
            return ToastificationWrapper(
              config: toaster.getConfig(),
              child: MaterialApp.router(
                debugShowMaterialGrid: false,
                title: "BuildTek Leadflow",
                theme: ThemeData(primarySwatch: Colors.blue),
                routerConfig: AppRouter.router,
              ),
            );
          },
        ),
      ),
    );
  }
}
