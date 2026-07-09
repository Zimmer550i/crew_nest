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

    // bool neverShownOnboarding = false;
    // bool needAccountCreation = false;
    // bool needVerification = false;

    // if (neverShownOnboarding) {
    //   gotoOnboarding();
    // } else if (needVerification) {
    //   gotoVerification();
    // } else if (needAccountCreation) {
    //   gotoAccountCreation();
    // } else {
    //   gotoApp();
    // }

    // Get.to(() => ChooseLanguage());
  }

  static void gotoApp() {
    // Get.offAll(() => App(), routeName: "/app");
  }

  static void gotoVerification() {}

  static void gotoOnboarding() {}

  static void gotoAccountCreation() {}
}
