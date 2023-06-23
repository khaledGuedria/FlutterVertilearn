import 'package:day3_exemple/models/product.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent {}

class CartLoadScreenEvent extends CartEvent {}

class CartAddQuantityEvent extends CartEvent {}

class CartRemoveQuantityEvent extends CartEvent {}

class CartClearEvent extends CartEvent {}

class CartAddItemEvent extends CartEvent {
  //var
  final Product product;
  CartAddItemEvent(this.product);
}

class CartRemoveItemEvent extends CartEvent {
  //var
  final Product product;
  CartRemoveItemEvent(this.product);
}
