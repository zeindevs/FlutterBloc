import 'package:flutter/material.dart';
import 'package:flutter_base/bloc/counter.dart';
import 'package:flutter_base/bloc/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc counter = context.read<CounterBloc>();
    ThemeBloc theme = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CounterBloc, int>(
              bloc: counter,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => counter.remove(),
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () => counter.add(),
                    icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => theme.changeTheme(),
      ),
    );
  }
}
