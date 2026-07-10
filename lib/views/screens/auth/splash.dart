import 'package:crew_nest/services/redirect_service.dart';
import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/views/widgets/logo.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late final AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    RedirectService.redirectFromSplash();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/splash.png", fit: .cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.blue.withValues(alpha: 0.94),
              ),
              child: Center(
                child: Logo(size: 100, isWhite: true, showName: true),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 74,
                child: AnimatedBuilder(
                  animation: _progressController,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      value: _progressController.value,
                      minHeight: 8,
                      color: Colors.white,
                      backgroundColor: AppColors.black.shade100,
                      borderRadius: .circular(99),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
