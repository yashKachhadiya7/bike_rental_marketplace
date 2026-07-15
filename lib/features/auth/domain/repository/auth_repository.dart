abstract interface class AuthRepository {
  Future<bool> isLoggedIn();

  Future<bool> verifyOtp({
    required String mobileNumber,
    required String otp,
  });

  Future<void> logout();

  Future<String?> getLoggedInMobileNumber();
}