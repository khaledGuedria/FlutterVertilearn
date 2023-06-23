import 'package:day3_exemple/blocs/cart_bloc/cart_bloc.dart';
import 'package:day3_exemple/blocs/cart_bloc/cart_bloc_events.dart';
import 'package:day3_exemple/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<CartBloc>().add(CartAddItemEvent(Product.full(
              "1",
              "Boga Cidre",
              "Boisson Gazeuse",
              "https://izy.tn/monipec/2023/04/BOGA_CIDRE_24_CL_36a6cbf8f1.png",
              1.5)));
        },
        label: const Text("Add to cart"),
        icon: const Icon(Icons.shopping_bag_outlined),
      ),
    );
  }
}
