import 'package:hive/hive.dart';
import 'package:hivedio/user.dart';

class UserService {

  //Future
  Future<String> getString() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Hello Orange!";
  }
  //HIVE
  //1 : Add
  Future<void> addToHive(User u) async {
    Box userBox = await Hive.openBox("userBox");
    userBox.put("0000", {'name': u.name, 'age' : u.age});
    print('object ${userBox.get("0000")} saved successfully!');
    userBox.close();
  }

  //2 : Fetch



  //DIO
}