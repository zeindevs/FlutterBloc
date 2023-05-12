import 'package:flutter/material.dart';
import 'package:flutter_base/bloc/counter.dart';
import 'package:flutter_base/home/red_widget.dart';
import 'package:flutter_base/other/other.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Counter counter = BlocProvider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dependency Injection"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => BlocProvider.value(
          //       value: counter,
          //       child: const OtherPage(),
          //     ),
          //   ),
          // );

          Navigator.of(context).pushNamed("/other");
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: Center(
        child: Row(
          children: [
            Material(
              color: Colors.green,
              child: InkWell(
                onTap: () => counter.decrement(),
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.remove, color: Colors.white),
                ),
              ),
            ),
            const RedWidget(),
            Material(
              color: Colors.green,
              child: InkWell(
                onTap: () => counter.increment(),
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.remove, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
