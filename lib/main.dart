import "package:bloc/bloc.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterCubit counter = CounterCubit(initialData: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Apps"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<Object>(
              initialData: counter.initialData,
              stream: counter.stream,
              builder: (context, snapshot) {
                return Center(
                    child: Text(
                  "${snapshot.data}",
                  style: const TextStyle(fontSize: 50),
                ));
              }),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => counter.increment(),
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () => counter.decrement(),
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
