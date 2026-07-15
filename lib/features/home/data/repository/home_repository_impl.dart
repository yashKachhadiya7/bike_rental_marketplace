import '../../domain/repository/home_repository.dart';
import '../data_source/home_remote_data_source.dart';
import '../models/product_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductModel>> getProducts() {
    return remoteDataSource.getProducts();
  }
}