import 'package:day3_exemple/blocs/cart_bloc/cart_bloc.dart';
import 'package:day3_exemple/models/user.dart';
import 'package:day3_exemple/screen/cart_screen.dart';
import 'package:day3_exemple/screen/products.dart';
import 'package:day3_exemple/service/product_service.dart';
import 'package:day3_exemple/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //var
  late User user;
  int index = 0;
  var screens = [const ProductsScreen(), const CartScreen()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
            future: UserService().getEmail(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("Hello ${snapshot.data!}");
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
      body: BlocProvider(
        create: (context) => CartBloc(ProductService()),
        child: screens[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            //1
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            //2
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Cart"),
          ]),
    );
  }
}
