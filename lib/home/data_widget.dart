import 'package:flutter/material.dart';
import 'package:flutter_base/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Counter counter = BlocProvider.of<Counter>(context);
    Counter counter = context.read<Counter>();

    return BlocBuilder(
      bloc: counter,
      builder: (context, state) {
        return Text(
          "$state",
          style: const TextStyle(fontSize: 50),
        );
      },
    );
  }
}
