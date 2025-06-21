import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:home_decor/src/core/resources/constants.dart';
import 'package:home_decor/src/core/services/routing/app_router.dart';
import 'package:home_decor/src/core/services/routing/routes.dart';
import 'l10n/l10n.dart';

class HomeDecorApp extends StatelessWidget {
  final AppRouter appRouter;

  const HomeDecorApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      title: 'Home Decor',
      localeListResolutionCallback: L10n.localeListResolutionCallback,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      initialRoute: isLoggedInUser
          ? Routes.navbarPage
          : isOnboardingDone
          ? Routes.loginPage
          : Routes.onboardingPage,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
