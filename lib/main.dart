import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:home_decor/home_decor_app.dart';
import 'package:home_decor/src/core/resources/constants.dart';
import 'package:home_decor/src/core/extensions/string.dart';
import 'package:home_decor/src/core/services/custom_observer.dart';
import 'package:home_decor/src/core/services/di/dependency_injection.dart';
import 'package:home_decor/src/core/services/routing/app_router.dart';
import 'package:home_decor/src/core/services/shared_pref_helper.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setupDi();
  await checkIfLoggedInUser();
  await checkIfOnboardingIsDone();
  Bloc.observer = CustomBlocObserver();
  runApp(
    HomeDecorApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

checkIfOnboardingIsDone() async {
  isOnboardingDone =
      await SharedPrefHelper.getBool(
        SharedPrefKeys.isOnboardingDone,
      ) ??
      false;
}
