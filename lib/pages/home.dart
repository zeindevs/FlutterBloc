import 'package:flutter/material.dart';
import 'package:flutter_base/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Extension Method
    // 1. context.read()
    // 2. context.watch()
    // 3. context.select()
    CounterBloc counter = context.read<CounterBloc>(); // read one times
    // CounterBloc counter = context.watch<CounterBloc>(); // read multiple times
    // int value = context.select<CounterBloc, int>((value) => value.state);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Builder(builder: (context) {
              //   CounterBloc counterBloc = context.watch<CounterBloc>();
              //   return Text(
              //     "${counterBloc.state}",
              //     style: const TextStyle(fontSize: 100),
              //   );
              // }),
              Builder(builder: (context) {
                int value =
                    context.select<CounterBloc, int>((value) => value.state);
                return Text(
                  "$value",
                  style: const TextStyle(fontSize: 100),
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () => counter.decrement(),
                      icon: const Icon(Icons.remove)),
                  IconButton(
                      onPressed: () => counter.increment(),
                      icon: const Icon(Icons.add)),
                ],
              )
            ],
          ),
        ));
  }
}
