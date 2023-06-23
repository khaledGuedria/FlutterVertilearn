import 'package:day3_exemple/models/user.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //Future
  Future<String> getString() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Hello Orange!";
  }
  //HIVE
  //0 : Hive init

  //DIO
  //1 GET
  Future<List<dynamic>> fetchAllUsers() async {
    //var
    List<dynamic> users = [];
    //1 : URL
    var url = "https://business1.onrender.com/users";

    //2
    var headers = {
      'Content-Type': 'application/json'
      //'Authorization' : 'Bearer $token'
    };

    //3
    await Dio().get(url, options: Options(headers: headers)).then((response) {
      if (response.statusCode == 200) {
        List<dynamic> usersList = response.data;
        for (var element in usersList) {
          String name = element['fullname'] ?? "N/A";
          String email = element['email'] ?? "N/A";
        }
      }
    });
    return users;
  }

  Future<bool> loginFunction(User user) async {
    print("DIO started! ${user.email}");
    //var
    late bool LoggedIn;
    //DIO
    var url = "https://business1.onrender.com/users/login";
    var headers = {
      'Content-Type': 'application/json'
      //'Authorization' : 'Bearer $token'
    };
    await Dio().post(
        data: {"email": user.email, "password": user.password},
        url,
        options: Options(headers: headers)).then((response) async {
      if (response.statusCode == 200) {
        LoggedIn = true;
        var id = response.data['_id'];
        var email = response.data['email'];
        var password = response.data['password'];
        var userResult = User.full(id, email, password);
        //insert to local storage
        await SharedPreferences.getInstance().then((sp) {
          sp.setString("email", userResult.email);
          sp.setString("password", userResult.email);
        });
      }
    });

    return LoggedIn;
  }

  //Local
  Future<String> getEmail() async {
    late String email;
    await SharedPreferences.getInstance()
        .then((value) => email = value.getString("email")!);
    return email;
  }
}
