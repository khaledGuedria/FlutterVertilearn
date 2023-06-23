
import 'package:day3_exemple/screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginBlocState {}

class LoginBlocLoadingState extends LoginBlocState {}

class LoginBlocSuccessState extends LoginBlocState {
  LoginBlocSuccessState(BuildContext context) {
    Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
  }
}

class LoginBlocFailState extends LoginBlocState {}

class LoginBlocErrorState extends LoginBlocState {
  late String error;
  LoginBlocErrorState(this.error);
}

class LoginBlocInitState extends LoginBlocState {

}
