import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasource/auth_local_data_source.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

class DependencyInjection {
  static late SharedPreferences preferences;

  static late AuthRepository authRepository;



  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();

    final localDataSource =
    AuthLocalDataSourceImpl(preferences);

    authRepository =
        AuthRepositoryImpl(localDataSource);
  }
}