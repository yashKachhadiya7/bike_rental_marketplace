import 'package:bike_rental_marketplace/features/auth/presentation/bloc/auth_event.dart';
import 'package:bike_rental_marketplace/features/auth/presentation/bloc/auth_state.dart';
import 'package:bloc/bloc.dart';

import '../../domain/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(const AuthInitial()) {
    on<CheckLoginStatus>(_onCheckLoginStatus);
    on<LoginWithMobile>(_onLoginWithMobile);
    on<VerifyOtp>(_onVerifyOtp);
    on<Logout>(_onLogOut);
  }


  Future<void> _onCheckLoginStatus(CheckLoginStatus event,
      Emitter<AuthState> emit,) async {
    emit(const AuthLoading());

    final isLoggedIn = await repository.isLoggedIn();
    if (!isLoggedIn) {
      emit(const Unauthenticated());
      return;
    }

    final mobileNumber =
    await repository.getLoggedInMobileNumber();

    if (mobileNumber == null) {
      emit(const Unauthenticated());
      return;
    }

    emit(
      Authenticated(mobileNumber),
    );
  }

  Future<void> _onLoginWithMobile(LoginWithMobile event,
      Emitter<AuthState> emit) async {
    emit(
      OtpSent(event.mobileNumber),
    );
  }

  Future<void> _onVerifyOtp(VerifyOtp event,
      Emitter<AuthState> emit,) async {
    emit(const AuthLoading());

    final success = await repository.verifyOtp(
      mobileNumber: event.mobileNumber,
      otp: event.otp,
    );

    if (!success) {
      emit(
        const AuthError(
          'Invalid OTP',
        ),
      );
      return;
    }

    emit(
      Authenticated(
        event.mobileNumber,
      ),
    );
  }

  Future<void> _onLogOut(Logout event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    await repository.logout();

    emit(
      const Unauthenticated(),
    );
  }
}