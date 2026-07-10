import 'package:crew_nest/views/screens/auth/onboarding/welcome_screen.dart';
import 'package:get/get.dart';

class RedirectService {
  static const Duration splashDuration = Duration(seconds: 2);

  static Future<bool> getUserData() async {
    return false;
  }

  static Future<void> redirectFromSplash() async {
    final stopWatch = Stopwatch();
    stopWatch.start();
    await getUserData().timeout(splashDuration);
    final apiTime = stopWatch.elapsed;

    if (splashDuration > apiTime) {
      await Future.delayed(splashDuration - apiTime);
    }

    bool neverShownOnboarding = true;
    // bool needAccountCreation = false;
    // bool needVerification = false;

    if (neverShownOnboarding) {
      gotoOnboarding();
    }
    // } else if (needVerification) {
    //   gotoVerification();
    // } else if (needAccountCreation) {
    //   gotoAccountCreation();
    // } else {
    //   gotoApp();
    // }
  }

  static void gotoApp() {
    // Get.offAll(() => App(), routeName: "/app");
  }

  static void gotoVerification() {}

  static void gotoOnboarding() {
    Get.to(() => WelcomeScreen());
  }

  static void gotoAccountCreation() {}
}
