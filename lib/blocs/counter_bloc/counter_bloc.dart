import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivedio/blocs/counter_bloc/counter_events.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0){
    on<CounterAddPressedEvent>((event, emit) => emit(state + 1));
    on<CounterRemovePressedEvent>((event, emit) => emit(state - 1));
  }

  
}