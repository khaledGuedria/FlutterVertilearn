import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivedio/blocs/users_bloc/users_bloc.dart';
import 'package:hivedio/blocs/users_bloc/users_bloc_events.dart';
import 'package:hivedio/blocs/users_bloc/users_bloc_states.dart';
import 'package:hivedio/user.dart';
import 'package:hivedio/user_item.dart';
import 'package:hivedio/user_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //life cycle
  @override
  void initState() {
    super.initState();
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 3"),
        
      ),
      body: BlocBuilder<UserBloc, UsersBlocState>(builder: (context, state) {
        if(state is UsersBlocLoadingState){
          return const  Center(child: CircularProgressIndicator(),);
        } 
        if(state is UsersBlocLoadedState){
          return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
              return UserItem(state.users[index]);
            },);
        }
        if(state is UsersBlocErrorState){
          return const Center(child: Text("No available data"),);
        }
        return Container();
      },)
    );
  }
}
