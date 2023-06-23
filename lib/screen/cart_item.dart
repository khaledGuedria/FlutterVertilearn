import 'package:day3_exemple/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  //var
  final Product product;
  final int quantity;
  const CartItem(this.product, this.quantity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //1
                  Image.network(
                    product.image,
                    width: 100,
                  ),
                  //2
                  Column(
                    children: [
                      //1
                      Text(product.name),
                      //1
                      Text(
                        "${product.prix.toString()} TND",
                        style: const TextStyle(color: Colors.deepPurple),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //1
                  FloatingActionButton.small(
                      onPressed: () {}, child: const Icon(Icons.remove)),
                  Text(
                    "${quantity.toString()} TND",
                    style: const TextStyle(color: Colors.deepPurple),
                  ),
                  //3
                  FloatingActionButton.small(
                      onPressed: () {}, child: const Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
