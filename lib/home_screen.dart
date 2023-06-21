import 'package:flutter/material.dart';
import 'package:hivedio/user.dart';
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
            await UserService().addToHive(User(name: "Khaled", age: 30)).then((value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Saved successfully!"))));
          }, icon:const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: UserService().getString(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data!),
            );
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
