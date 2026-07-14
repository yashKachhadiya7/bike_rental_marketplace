import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable{
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Initial state
final class AuthInitial extends AuthState{
  const AuthInitial();
}

// Loading state
final class AuthLoading extends AuthState {
  const AuthLoading();
}

// User is not logged in
final class Unauthenticated extends AuthState {
  const Unauthenticated();
}

// OTP sent successfully
final class OtpSent extends AuthState {
  final String mobileNumber;

  const OtpSent(this.mobileNumber);

  @override
  List<Object?> get props => [mobileNumber];
}

// User logged in successfully
final class Authenticated extends AuthState {
  final String mobileNumber;
  const Authenticated(this.mobileNumber);

  @override
  List<Object?> get props => [mobileNumber];
}

// Something went wrong
final class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}