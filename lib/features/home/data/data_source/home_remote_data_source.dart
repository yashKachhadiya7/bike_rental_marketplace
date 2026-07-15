import '../../../../core/network/dio_client.dart';
import '../models/product_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient;

  HomeRemoteDataSourceImpl(this.dioClient);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dioClient.get('products');

    final List<dynamic> data = response.data;

    return data
        .map(
          (json) => ProductModel.fromJson(
        json as Map<String, dynamic>,
      ),
    )
        .toList();
  }
}