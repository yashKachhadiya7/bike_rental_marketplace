import 'package:bike_rental_marketplace/core/routes/app_pages.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bike Rental Marketplace',
      routes: AppPages.routes,
      home: const Scaffold(
        body: Center(
            child: Text(
              'Bike Rental Marketplace',
            ),
        ),
      ),
    );
  }
}
