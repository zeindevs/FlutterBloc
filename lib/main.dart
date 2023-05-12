import 'package:flutter/material.dart';
import 'package:flutter_base/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => BlocProvider.value(
      //         value: counter,
      //         child: const HomePage(),
      //       ),
      //   "/other": (context) => BlocProvider.value(
      //         value: counter,
      //         child: const OtherPage(),
      //       ),
      // },
      onGenerateRoute: router.onRoute,
    );
  }
}
