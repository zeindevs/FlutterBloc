import 'package:flutter/material.dart';
import 'package:flutter_base/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(title: const Text("Bloc Consumer")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<Counter, int>(
            bloc: counter,
            builder: (context, state) {
              return Text("$state", style: const TextStyle(fontSize: 50));
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text("Odd Number"),
                ),
              );
            },
            buildWhen: (previous, current) {
              return current == 10 ? true : false;
            },
            listenWhen: (previous, current) {
              return current % 2 == 0 ? true : false;
            },
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
