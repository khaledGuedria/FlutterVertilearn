import 'package:flutter/material.dart';

class InheritedComponent extends InheritedWidget {
  //var
  final String number;
  final Widget inheritedChild;
  VoidCallback resetNumber;
  //constructor
  InheritedComponent({required this.number, required this.inheritedChild, required this.resetNumber}) : super( child: inheritedChild);
  
  //action
  static InheritedComponent of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<InheritedComponent>())!;
  }
  //impl
  @override
  bool updateShouldNotify(InheritedComponent oldWidget) {
    return number != oldWidget.number;
  }

}