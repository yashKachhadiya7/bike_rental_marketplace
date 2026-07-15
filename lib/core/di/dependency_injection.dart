import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasource/auth_local_data_source.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/home/data/repository/home_repository_impl.dart';
import '../../features/home/domain/repository/home_repository.dart';
import '../network/dio_client.dart';

class DependencyInjection {
  static late SharedPreferences preferences;

  static late AuthRepository authRepository;

  static late DioClient dioClient;

  static late HomeRepository homeRepository;


  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();

    final localDataSource =
    AuthLocalDataSourceImpl(preferences);

    authRepository =
        AuthRepositoryImpl(localDataSource);

    dioClient = DioClient();

    final homeRemoteDataSource =
    HomeRemoteDataSourceImpl(dioClient);

    homeRepository =
        HomeRepositoryImpl(homeRemoteDataSource);
  }
}