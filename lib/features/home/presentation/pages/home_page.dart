import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../data/models/bike_details_arguments.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/bike_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().add(
      const LoadProducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Bike Rental Marketplace',
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

          if(state is HomeLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is HomeError){
            return Center(
              child: Text(
                state.message,
              ),
            );
          }

          if(state is HomeLoaded){

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Bikes",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];

                      return BikeCard(
                        product: product,
                        index: index,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.bikeDetails,
                            arguments: BikeDetailsArguments(
                              product: product,
                              index: index,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}