import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivedio/blocs/counter_bloc/counter_bloc.dart';
import 'package:hivedio/blocs/users_bloc/users_bloc.dart';
import 'package:hivedio/blocs/users_bloc/users_bloc_events.dart';
import 'package:hivedio/counter_screen.dart';
import 'package:hivedio/home_screen.dart';
import 'package:hivedio/user_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UserService().initHive();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(create: (context) => UserBloc()..add(UsersBlocLoadEvent()),)
        ],
        child: const HomeScreen()),
    );
  }
}
