import 'package:flutter/material.dart';
import 'package:flutter_base/bloc/counter.dart';
import 'package:flutter_base/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: const HomePage(),
      ),
    );
  }
}
