import '../../data/models/product_model.dart';

abstract interface class HomeRepository {
  Future<List<ProductModel>> getProducts();
}