import 'package:bike_rental_marketplace/features/auth/presentation/bloc/auth_event.dart';
import 'package:bike_rental_marketplace/features/auth/presentation/bloc/auth_state.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(const AuthInitial()) {
    on<CheckLoginStatus>(_onCheckLoginStatus);
    on<LoginWithMobile>(_onLoginWithMobile);
    on<VerifyOtp>(_onVerifyOtp);
    on<Logout>(_onLogOut);
  }
}

Future<void> _onCheckLoginStatus(
  CheckLoginStatus event,
  Emitter<AuthState> emit,
) async {}

Future<void> _onLoginWithMobile(
    LoginWithMobile event, Emitter<AuthState> emit) async {}

Future<void> _onVerifyOtp(
  VerifyOtp event,
  Emitter<AuthState> emit,
) async {}

Future<void> _onLogOut(Logout event, Emitter<AuthState> emit) async {}
