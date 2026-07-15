import 'package:bike_rental_marketplace/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/constants/app_constants.dart';
import '../datasource/auth_local_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<bool> isLoggedIn() {
    return localDataSource.isLoggedIn();
  }

  @override
  Future<bool> verifyOtp({
    required String mobileNumber,
    required String otp,
  }) async {
    if (otp != AppConstants.dummyOtp) {
      return false;
    }

    await localDataSource.saveLogin(mobileNumber);

    return true;
  }

  @override
  Future<void> logout() {
    return localDataSource.logout();
  }

  @override
  Future<String?> getLoggedInMobileNumber() {
    return localDataSource.getLoggedInMobileNumber();
  }
}