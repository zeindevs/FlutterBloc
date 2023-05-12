import "package:bloc/bloc.dart";
import "package:flutter/foundation.dart";
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
  int? current;
  int? next;

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    current = change.currentState;
    next = change.nextState;
    if (kDebugMode) {
      print(change);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    if (kDebugMode) {
      print(error);
    }
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
                  child: Column(
                    children: [
                      Text(
                        "${snapshot.data}",
                        style: const TextStyle(fontSize: 50),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Current: ${counter.current}",
                        style: const TextStyle(fontSize: 50),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Next: ${counter.next}",
                        style: const TextStyle(fontSize: 50),
                      ),
                    ],
                  ),
                );
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
                  icon: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
