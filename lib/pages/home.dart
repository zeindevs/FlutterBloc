import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/bloc/counter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Counter counter = Counter(init: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Listener")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<Counter, int>(
            bloc: counter,
            listener: (context, state) {
              if (kDebugMode) {
                print(state);
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text("Odd Number"),
                ),
              );
            },
            listenWhen: (previous, current) {
              return current % 2 == 0 ? true : false;
            },
            child: BlocBuilder<Counter, int>(
              bloc: counter,
              builder: (context, state) {
                return Text("$state", style: const TextStyle(fontSize: 50));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => counter.increment(),
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () => counter.decrement(),
                  icon: const Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}
