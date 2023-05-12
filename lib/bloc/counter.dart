import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class Counter extends Cubit<int> {
  Counter({this.init = 0}) : super(init);

  int init;

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
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
