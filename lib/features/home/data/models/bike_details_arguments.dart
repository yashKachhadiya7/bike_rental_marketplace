import 'package:bike_rental_marketplace/features/home/data/models/product_model.dart';

class BikeDetailsArguments {
  final ProductModel product;
  final int index;

  const BikeDetailsArguments({
    required this.product,
    required this.index,
  });
}