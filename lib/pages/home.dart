import 'package:flutter/material.dart';
import 'package:flutter_base/bloc/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc user = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          BlocSelector<UserBloc, Map<String, dynamic>, String>(
            selector: (state) => state["name"],
            builder: (context, state) {
              return Text("Name: $state");
            },
          ),
          BlocSelector<UserBloc, Map<String, dynamic>, int>(
            selector: (state) => state["age"],
            builder: (context, state) {
              return Text("Age: $state");
            },
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (value) => user.changeName(value),
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                onPressed: () => user.changeAge(user.state["age"] - 1),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => user.changeAge(user.state["age"] + 1),
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
