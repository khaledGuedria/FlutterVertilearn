import 'package:day3_exemple/blocs/login_bloc/login_event.dart';
import 'package:day3_exemple/blocs/login_bloc/login_satetes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/user_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocInitState()){

    on<LoginButtonPressedEvent>((event, emit) async {
      //WS call
      emit(LoginBlocLoadingState());
      try {
         await UserService().loginFunction(event.user).then((isOK) => isOK ? emit(LoginBlocSuccessState(event.context)) : emit(LoginBlocFailState()));
      } catch (e){
        emit(LoginBlocErrorState(e.toString()));
      }
    });
  }

  
}