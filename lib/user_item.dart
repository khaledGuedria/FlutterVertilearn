import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hivedio/user.dart';

class UserItem extends StatelessWidget {
  //var
  final User user;
  const UserItem(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            //1
            const Icon(Icons.person_outlined),
            const SizedBox(width: 20,),
            //2
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //1 
              Text(user.name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              //2
              Text(user.email)
            ],)
          ],
        ),
      ),
    );
  }
}