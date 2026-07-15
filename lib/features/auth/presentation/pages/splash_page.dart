import 'package:bike_rental_marketplace/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bike_rental_marketplace/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../bloc/auth_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    context.read<AuthBloc>().add(
      const CheckLoginStatus()
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc,AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.login,
          );
        }
        if(state is Unauthenticated){
          Navigator.pushReplacementNamed(context,
              AppRoutes.login
          );
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
