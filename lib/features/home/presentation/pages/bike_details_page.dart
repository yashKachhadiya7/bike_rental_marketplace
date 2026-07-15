import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/bike_mapper.dart';
import '../../data/models/bike_details_arguments.dart';
import '../../data/models/product_model.dart';

class BikeDetailsPage extends StatelessWidget {
  const BikeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final BikeDetailsArguments arguments =
    ModalRoute.of(context)!.settings.arguments
    as BikeDetailsArguments;

    final ProductModel product = arguments.product;

    final int index = arguments.index;

    final bool available =
    BikeMapper.isAvailable(index);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bike Details',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            Center(
              child: Image.network(
                product.image,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              BikeMapper.getBikeName(index),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [

                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),

                const SizedBox(width: 6),

                Text(
                  product.rating.rate.toString(),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: available
                    ? Colors.green.shade100
                    : Colors.red.shade100,
                borderRadius:
                BorderRadius.circular(20),
              ),
              child: Text(
                available
                    ? "Available"
                    : "Unavailable",
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "₹${product.price.toInt()}/day",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              product.description,
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: available
                    ? () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.booking,
                    arguments: arguments,
                  );
                }
                    : null,
                child: const Text(
                  "Book Now",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}