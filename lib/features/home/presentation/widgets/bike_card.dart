import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/bike_mapper.dart';
import '../../data/models/product_model.dart';

class BikeCard extends StatelessWidget {
  final ProductModel product;
  final int index;
  final VoidCallback onTap;

  const BikeCard({
    super.key,
    required this.product,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final available = BikeMapper.isAvailable(product.id);

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Center(
                child: Hero(
                  tag: product.id,
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    height: 170,
                    fit: BoxFit.contain,

                    placeholder: (context, url) {
                      return const SizedBox(
                        height: 170,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },

                    errorWidget: (context, url, error) {
                      return const SizedBox(
                        height: 170,
                        child: Icon(
                          Icons.broken_image,
                          size: 80,
                        ),
                      );
                    },
                  ),
                )
              ),

              const SizedBox(height: 16),

              Text(
                BikeMapper.getBikeName(product.id),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Row(
                children: [

                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),

                  const SizedBox(width: 4),

                  Text(
                    product.rating.rate.toString(),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                "₹${product.price.toInt()}/day",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
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
                  style: TextStyle(
                    color: available
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onTap,
                  child: const Text(
                    "View Details",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}