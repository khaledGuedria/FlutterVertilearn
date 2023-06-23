import 'package:day3_exemple/blocs/cart_bloc/cart_bloc_events.dart';
import 'package:day3_exemple/blocs/cart_bloc/cart_bloc_states.dart';
import 'package:day3_exemple/service/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  //var
  final ProductService ps;
  CartBloc(this.ps) : super(CartLoadingState()) {
    //1 : show products
    on<CartLoadScreenEvent>((event, emit) async {
      await ps
          .getProducts()
          .then((products) => emit(CartLoadedState(products)));
    });
    //2 : update products list
    on<CartAddItemEvent>((event, emit) async {
      await ps.addProduct(event.product).then((value) async => await ps
          .getProducts()
          .then((products) => emit(CartLoadedState(products))));
    });
    on<CartRemoveItemEvent>((event, emit) async {
      await ps.deleteOne(event.product).then((value) async => await ps
          .getProducts()
          .then((products) => emit(CartLoadedState(products))));
    });
    on<CartClearEvent>((event, emit) async {
      await ps.clear().then((value) async => CartLoadedState(const []));
    });
  }
}
