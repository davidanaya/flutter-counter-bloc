import 'package:flutter_counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_counter_bloc/bloc/even_counter_bloc.dart';

class AppBloc {
  CounterBloc _counter;
  EvenCounterBloc _evenCounter;

  AppBloc() {
    _counter = CounterBloc();
    _evenCounter = EvenCounterBloc();
    _counter.counter$.listen(_evenCounter.increment.add);
  }

  CounterBloc get counterBloc => _counter;
  EvenCounterBloc get evenCounterBloc => _evenCounter;
}
