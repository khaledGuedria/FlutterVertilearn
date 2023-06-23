import 'package:day3_exemple/models/user.dart';
import 'package:flutter/material.dart';

class LoginEvent {}

class LoginButtonPressedEvent extends LoginEvent {
  late User user;
  late BuildContext context;
  LoginButtonPressedEvent(this.user, this.context);
}
