import 'package:day3_exemple/blocs/cart_bloc/cart_bloc.dart';
import 'package:day3_exemple/blocs/cart_bloc/cart_bloc_states.dart';
import 'package:day3_exemple/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoadedState) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return;
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
