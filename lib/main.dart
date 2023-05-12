import 'package:flutter/material.dart';
import 'package:flutter_base/app.dart';
import 'package:flutter_base/bloc/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/bloc/counter.dart';
import 'package:flutter_base/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeBloc theme = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => theme),
      ],
      child: const App(),
    );
  }
}
