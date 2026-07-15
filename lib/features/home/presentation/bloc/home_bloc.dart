import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(const HomeInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
      LoadProducts event,
      Emitter<HomeState> emit,
      ) async {
    emit(const HomeLoading());

    try {
      final products = await repository.getProducts();

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
}