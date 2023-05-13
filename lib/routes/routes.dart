import 'package:flutter/material.dart';
import 'package:flutter_base/404/not_found.dart';
import 'package:flutter_base/bloc/counter.dart';
import 'package:flutter_base/home/home.dart';
import 'package:flutter_base/other/other.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final Counter counter = Counter();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counter,
            child: const HomePage(),
          ),
        );
      case "/other":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counter,
            child: const OtherPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
    }
  }
}
