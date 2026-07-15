import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable{
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// App started → Check if user is already logged in
 final class CheckLoginStatus extends AuthEvent{
  const CheckLoginStatus();
 }

// User entered mobile number

 final class LoginWithMobile extends AuthEvent{
   final String mobileNumber;

   const LoginWithMobile(this.mobileNumber);

   @override
   List<Object?> get props => [mobileNumber];

 }

/// User entered OTP
final class VerifyOtp extends AuthEvent {
  final String mobileNumber;
  final String otp;

  const VerifyOtp({
    required this.mobileNumber,
    required this.otp,
  });

  @override
  List<Object?> get props => [
    mobileNumber,
    otp,
  ];
}

/// User logged out
final class Logout extends AuthEvent {
  const Logout();
}