abstract interface class AuthRepository{
  Future<bool> isLoggedIn();

  Future<void> saveLogin(String mobileNumber);

  Future<void> logout();

  Future<bool> verifyOtp(String otp);

  Future<String?> getLoggedInMobileNumber();
}