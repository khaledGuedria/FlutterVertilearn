import 'package:day3_exemple/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/login_bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
    ),
    home:  MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc()),
        ],
        child: const LoginScreen()),
    );
    
  }
}
