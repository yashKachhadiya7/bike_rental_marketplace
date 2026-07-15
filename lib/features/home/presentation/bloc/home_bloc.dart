import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/bike_mapper.dart';
import '../../data/models/product_model.dart';
import '../../domain/repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  List<ProductModel> _allProducts = [];
  HomeBloc(this.repository) : super(const HomeInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<SearchProducts>(_onSearchProducts);
  }


  Future<void> _onLoadProducts(
      LoadProducts event,
      Emitter<HomeState> emit,
      ) async {

    emit(const HomeLoading());

    try {
      final products = await repository.getProducts();
      _allProducts = products;
      emit(
        HomeLoaded(products),
      );
    } catch (_) {
      emit(
        const HomeError(
          'Failed to load products',
        ),
      );
    }
  }

  void _onSearchProducts(
      SearchProducts event,
      Emitter<HomeState> emit,
      ) {
    if (event.query.trim().isEmpty) {
      emit(
        HomeLoaded(_allProducts),
      );
      return;
    }

    final filteredProducts = _allProducts.where((product) {
      final bikeName = BikeMapper.getBikeName(product.id);

      return bikeName
          .toLowerCase()
          .contains(
        event.query.toLowerCase(),
      );
    }).toList();

    emit(
      HomeLoaded(filteredProducts),
    );
  }
}