import 'package:flutter/material.dart';
import 'package:hivedio/user.dart';
import 'package:hivedio/user_item.dart';
import 'package:hivedio/user_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 2"),
        actions: [
          IconButton(onPressed: () async {
            await UserService().addToSP().then((value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Saved successfully!"))));
          }, icon:const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: UserService().fetchAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
              return UserItem(snapshot.data![index]);
            },);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
