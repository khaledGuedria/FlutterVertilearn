import 'package:equatable/equatable.dart';
import 'package:hivedio/user.dart';

class UsersBlocState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UsersBlocLoadingState extends UsersBlocState  {
  @override
  List<Object?> get props => [];
}

class UsersBlocLoadedState extends UsersBlocState {
  late List<User> users;
  UsersBlocLoadedState(this.users);
  @override
  List<Object?> get props => users;
  
}

class UsersBlocErrorState extends UsersBlocState {
  late String error;
  UsersBlocErrorState(this.error);
  @override
  List<Object?> get props => [error];
  
}