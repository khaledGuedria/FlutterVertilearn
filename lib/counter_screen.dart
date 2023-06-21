import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hivedio/blocs/counter_bloc/counter_bloc.dart';
import 'package:hivedio/blocs/counter_bloc/counter_events.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<CounterBloc, int>(builder: (context, state) {
          return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //1
                  FloatingActionButton.extended(
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterRemovePressedEvent());
                    },
                    label: const Text("Remove"),
                    icon: const Icon(Icons.remove),
                  ),
                  //2
                   Text(state.toString(), style:  const TextStyle(color: Colors.deepPurple, fontSize: 42),),
                  //3
                  FloatingActionButton.extended(
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterAddPressedEvent());
                    },
                    label: const Text("Add"),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            );
          
        },),
      ),
    );
  }
}
