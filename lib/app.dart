import 'package:bike_rental_marketplace/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/dependency_injection.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            DependencyInjection.authRepository,
          ),
        ),
        BlocProvider(
          create: (context) => HomeBloc(
              DependencyInjection.homeRepository,
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bike Rental Marketplace',
        initialRoute: AppRoutes.splash,
        routes: AppPages.routes,
      ),
    );
  }
}