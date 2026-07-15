import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/bike_mapper.dart';
import '../../../home/data/models/bike_details_arguments.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int rentalDays = 1;

  void _incrementDays() {
    setState(() {
      rentalDays++;
    });
  }

  void _decrementDays() {
    if (rentalDays == 1) return;

    setState(() {
      rentalDays--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
    ModalRoute.of(context)!.settings.arguments
    as BikeDetailsArguments;

    final product = arguments.product;

    final bikeName =
    BikeMapper.getBikeName(product.id);

    final totalPrice =
        product.price.toInt() * rentalDays;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Bike",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            Center(
              child: Image.network(
                product.image,
                height: 180,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              bikeName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "₹${product.price.toInt()} / day",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Rental Duration",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [

                IconButton(
                  onPressed: _decrementDays,
                  icon: const Icon(
                    Icons.remove_circle,
                    size: 36,
                  ),
                ),

                Text(
                  "$rentalDays Days",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  onPressed: _incrementDays,
                  icon: const Icon(
                    Icons.add_circle,
                    size: 36,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              "Total Price",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),

            const SizedBox(height: 8),

            Text(
              "₹$totalPrice",
              style: const TextStyle(
                fontSize: 28,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  _showSuccessDialog();
                },
                child: const Text(
                  "Confirm Booking",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "Booking Confirmed 🎉",
          ),
          content: const Text(
            "Your bike has been booked successfully.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                      (route) => false,
                );
              },
              child: const Text(
                "OK",
              ),
            ),
          ],
        );
      },
    );
  }
}