import 'package:BuildTek/bloc/auth/authenticate/authenicate_bloc.dart';
import 'package:BuildTek/bloc/auth/authenticate/authenticate_event.dart';
import 'package:BuildTek/bloc/auth/splash/splashscreen_bloc.dart';
import 'package:BuildTek/respositories/auth/auth_repository.dart';
import 'package:BuildTek/services/api_service.dart';
import 'package:BuildTek/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders {
  static List<RepositoryProvider> repositoryProvider = [
    // ---service---
    RepositoryProvider<ApiService>(
      create:
          (context) => ApiService(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          ),
      lazy: true,
    ),
    RepositoryProvider<AuthService>(
      create: (context) => AuthService(apiService: context.read<ApiService>()),
      lazy: true,
    ),

    // ---- Repositories ----
    RepositoryProvider<AuthRepository>(
      create:
          (context) => AuthRepository(authService: context.read<AuthService>()),
      lazy: true,
    ),
  ];

  static List<BlocProvider> blocProviders = [
    BlocProvider<SplashScreenBloc>(
      create: (context) => SplashScreenBloc(),
      lazy: true,
    ),

     BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc()..add(LoginEvent()),
    )
  
    // BlocProvider<AuthLoginBloc>(
    //   create:
    //       (context) => AuthLoginBloc(
    //         deviceBloc: BlocProvider.of<DeviceBloc>(context),
    //         authRepository: RepositoryProvider.of<AuthRepository>(context),
    //       ),
    //   lazy: true,
    // ),
  ];
}
