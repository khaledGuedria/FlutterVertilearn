import 'package:day3_exemple/models/product.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {}

class CartLoadingState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoadedState extends CartState {
  final List<Product> products;
  CartLoadedState(this.products);
  @override
  List<Object?> get props => products;
}

class CartAddItemState extends CartState {
  final List<Product> products;
  CartAddItemState(this.products);
  @override
  List<Object?> get props => products;
}

class CartRemoveItemState extends CartState {
  final List<Product> products;
  CartRemoveItemState(this.products);
  @override
  List<Object?> get props => products;
}
