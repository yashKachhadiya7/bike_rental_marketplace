import 'package:flutter/cupertino.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/otp_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/home/presentation/pages/bike_details_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splash: (_) => const SplashPage(),
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.otp: (_) => const OtpPage(),
    AppRoutes.home: (_) => const HomePage(),
    AppRoutes.bikeDetails: (_) => const BikeDetailsPage(),
  };
}