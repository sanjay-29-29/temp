import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/toastication_config.dart';
import 'splashscreen_bloc.dart';
import 'splashscreen_state.dart';

class SplashBlocConsumer extends StatelessWidget {
  const SplashBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        if (state is SplashScreenLoaded) {
          context.go(state.route);
        } else if (state is SplashScreenError) {
          toaster.showError(title: state.message);
        }
      },
      builder: (context, state) {
        return SizedBox.shrink();
      },
    );
  }
}
