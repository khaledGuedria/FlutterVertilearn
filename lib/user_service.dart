import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivedio/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //Future
  Future<String> getString() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Hello Orange!";
  }
  //HIVE

  //0 : Hive init
  Future<void> initHive() async {
    await getApplicationDocumentsDirectory().then((dir) {
      Hive.init(dir.path);
      //Hive.isAdapterRegistered(0)
      Hive.registerAdapter(UserAdapter());
    });
  }

  //1 : Add
  Future<void> addToHive(User u) async {
    //await initHive().then((value) async {
    Box userBox = await Hive.openBox("userBox");
    userBox.add(u);
    for (User item in userBox.values.toList()) {
      print("${item.name} - ${item.age}");
    }
    //userBox.close();
    // });
  }

  Future<void> addToSP() async {
    await SharedPreferences.getInstance().then((sp) => sp
        .setString("user_token", "Orange-Token")
        .then((value) => value
            ? print("User ${sp.get("user_token")}")
            : print("Something Wrong!")));
  }

  //2 : Fetch

  //DIO
}
