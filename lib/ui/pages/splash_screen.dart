import 'package:BuildTek/bloc/auth/splash/splashscreen_bloc.dart';
import 'package:BuildTek/bloc/auth/splash/splashscreen_consumer.dart';
import 'package:BuildTek/bloc/auth/splash/splashscreen_event.dart';
import 'package:BuildTek/constants/asset_constants.dart';
import 'package:BuildTek/constants/color_constants.dart';
import 'package:BuildTek/ui/wrapper_class/responseive_container.dart';
import 'package:BuildTek/ui/wrapper_class/responsive_postioned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  static const String route = '/';
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return _buildMobileSplashScreen(screenSize);
  }

  Widget _buildMobileSplashScreen(Size screenSize) {
    return BlocProvider(
      create: (context) => SplashScreenBloc()..add(InitializeApp()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AssetConstants.gridImage,
                fit: BoxFit.fill,
              ),
            ),
            ResponsivePositioned(
              top: 270,
              left: 1,
              right: 0,
              bottom: 0,
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetConstants.flashImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            ResponsivePositioned(
              top: 122,
              left: 63,
              child: ResponsiveContainer(
                width: 290,
                height: 70,
                child: Image.asset(
                  AssetConstants.logoText,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned.fill(child: SplashBlocConsumer()),
          ],
        ),
      ),
    );
  }
}
