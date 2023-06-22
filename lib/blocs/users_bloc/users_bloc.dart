import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivedio/blocs/users_bloc/users_bloc_events.dart';
import 'package:hivedio/blocs/users_bloc/users_bloc_states.dart';
import 'package:hivedio/user_service.dart';

class UserBloc extends Bloc<UsersBlocEvent, UsersBlocState> {
  UserBloc(): super(UsersBlocLoadingState()) {
    on<UsersBlocLoadEvent>((event, emit) async{
      emit(UsersBlocLoadingState());
      try {
         await UserService().fetchAllUsers().then((users) => emit(UsersBlocLoadedState(users)));
      } catch (e){
        emit(UsersBlocErrorState(e.toString()));
      }


    });
    
  }


}