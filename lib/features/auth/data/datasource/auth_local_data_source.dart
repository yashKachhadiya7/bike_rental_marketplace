import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/storage_constants.dart';

abstract interface class AuthLocalDataSource {
  Future<bool> isLoggedIn();

  Future<void> saveLogin(String mobileNumber);

  Future<void> logout();

  Future<String?> getLoggedInMobileNumber();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource{
  final SharedPreferences preferences;

  AuthLocalDataSourceImpl(this.preferences);

  @override
  Future<bool> isLoggedIn() async {
    return preferences.getBool(StorageConstants.isLoggedIn) ?? false;
  }

  @override
  Future<void> saveLogin(String mobileNumber) async {
    await preferences.setBool(StorageConstants.isLoggedIn, true);
    await preferences.setString(StorageConstants.mobileNumber, mobileNumber);
  }

  @override
  Future<void> logout() async {
    await preferences.remove(StorageConstants.isLoggedIn);

    await preferences.remove(StorageConstants.mobileNumber);
  }

  @override
  Future<String?> getLoggedInMobileNumber() async {
    return preferences.getString(
      StorageConstants.mobileNumber,
    );
  }
}